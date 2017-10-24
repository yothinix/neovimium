if &compatible
  set nocompatible
endif
set runtimepath+=/Users/man/.nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/man/.nvim/bundles')
  call dein#begin('/Users/man/.nvim/bundles')

  call dein#add('/Users/man/.nvim/bundles/repos/github.com/Shougo/dein.vim')

" Installed Plugin
  call dein#add('scrooloose/nerdtree')
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('jmcantrell/vim-virtualenv')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('raimondi/delimitmate')
  call dein#add('w0rp/ale')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('mileszs/ack.vim')
  call dein#add('alfredodeza/pytest.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('rakr/vim-one')

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" nvim configuration
filetype plugin indent on
syntax enable
set number

" set search
set incsearch hlsearch
filetype plugin indent on

" set tab configuration
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" set turn off swap
set nobackup
set nowb
set noswapfile

" set autoreload buffer
set autoread

" set ignore compiled files
set wildignore=*.o,*~,*.pyc

" set navigation between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" html configuration
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" JavaScript configuration
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" one theme settings
set background=dark
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme one


" airline settings
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1

" NERDTree settings
if !&diff
    " Open NERDTree when vim is open
    " autocmd vimenter * NERDTree
    " autocmd vimenter * if !argc() | NERDTree | endif
    map <C-h> :NERDTreeToggle<CR>
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
	    \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]
endif
let NERDTreeShowHidden=1

" Easy motion settings
let mapleader = " "
let g:EasyMotion_leader_key = '<Leader>'

" Easy motion n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Easy motion Overwin search motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ctrlp ignore file in gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" devicon settings
set encoding=utf8
let g:airline_powerline_fonts = 1

" vim-jsx settings
let g:jsx_ext_required = 0

" Asynchronous Lint Engine settings
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
set statusline+=%{ALEGetStatusLine()}
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remap for Ack.vim (Text Search Engine)
nmap <leader>q :Ack! "\b<cword>\b" <CR>

" Use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Pytest.vim settings
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method -s<CR>

" Comfortable motion settings
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" vim-jedi settings
let g:jedi#use_splits_not_buffers = 'top'
let g:jedi#force_py_version = 3


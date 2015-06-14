# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-tskeleton
pkgver=4.13
_scriptid=17416
pkgrel=2
pkgdesc="File Templates and Code Skeletons/Snippets"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1160"
license=('GPL')
depends=(
vim-runtime
vim-tlib
)
groups=('vim-plugins')
install='vimdoc.install'
source=($pkgname.vba::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
   cd $srcdir
   _vimdir='usr/share/vim/vimfiles'

   install -d "$pkgdir"/${_vimdir}
   vim -c "UseVimball $srcdir" -c "q" $pkgname.vba
   
   tar -c ./ \
       --exclude $pkgname.vba \
       --exclude license.txt \
       --exclude .VimballRecord \
       --exclude doc/tags \
       | tar -xC "$pkgdir"/${_vimdir}
}

md5sums=('c484c1da8c23e9abe02dde370cd094a1')

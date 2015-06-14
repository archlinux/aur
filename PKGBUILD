# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail at com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-cecutil
pkgver=17
_scriptid=7618
pkgrel=2
pkgdesc='save/restore window position, mark position, selected user maps'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1066"
license=('custom:vim')
depends=(vim-runtime vim-align)
groups=('vim-plugins')
install='vimdoc.install'
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        LICENSE)
build() {
   cd "$srcdir"
   _vimdir='usr/share/vim/vimfiles'

   vim -c "UseVimball $srcdir" -c "q" $pkgname.vba

   install -Dm644 "$srcdir"/doc/cecutil.txt \
     "$pkgdir"/${_vimdir}/doc/cecutil.txt
  # conflic with vim-align
#   install -Dm644 "$srcdir"/plugin/cecutil.vim \
#     "$pkgdir"/${_vimdir}/plugin/cecutil.vim
   install -Dm644 "$srcdir"/LICENSE \
     "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('7c06938a0636b8ed20ff0e9d52366008'
         '4b731124dd6b469f22d64d8236c4ff87')

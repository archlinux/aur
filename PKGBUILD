# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kwpolska <kwpolska@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdtree
pkgver=5.0.0
_scriptid=17123
pkgrel=1
pkgdesc='Tree explorer plugin for navigating the filesystem'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1658'
license=('custom:WTFPL')
depends=('neovim')
groups=('neovim-plugins')
install='nvim-doc.install'
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'COPYING')
sha256sums=('16e8e0684d5964ececa47cbd4ac714d3ccf34247559af534f4b512baf5e0bf56'
            '7637386b5f81e8a719ca336233149005e5fa28b5e6054ea7b67de49355b0ad40')

package() {
  install -d \
    "$pkgdir/usr/share/nvim/runtime/"{doc,nerdtree_plugin,plugin,syntax}
  install -m644 doc/NERD_tree.txt "$pkgdir/usr/share/nvim/runtime/doc/"
  install -m644 nerdtree_plugin/{exec_menuitem,fs_menu}.vim \
    "$pkgdir/usr/share/nvim/runtime/nerdtree_plugin/"
  install -m644 plugin/NERD_tree.vim "$pkgdir/usr/share/nvim/runtime/plugin/"
  install -m644 syntax/nerdtree.vim "$pkgdir/usr/share/nvim/runtime/syntax/"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/scrooloose/nerdtree
# vim:set ts=2 sw=2 et:

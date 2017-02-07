# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-taglist
pkgver=46
_scriptid=19574
pkgrel=2
pkgdesc="A source code browser plugin for Neovim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=273"
license=('custom')
depends=('neovim' 'ctags')
makedepends=('unzip')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
sha256sums=('524e2a7001d1cf23449c443293b6e21aa654a1a238a52b6edce7f12d0cd98ba1'
            '4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')

package() {
  cd ${srcdir}

  installpath="${pkgdir}/usr/share/nvim/runtime"

  install -Dm644 doc/taglist.txt $installpath/doc/taglist.txt
  install -Dm644 plugin/taglist.vim $installpath/plugin/taglist.vim
  install -Dm644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/neovim-taglist/license.txt
}

# vim: set ts=2 sw=2 et:

# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-surround
pkgver=2.1
pkgrel=1
pkgdesc='Provides mappings to easily delete, change, and add paired "surroundings"'
arch=('any')
url='https://github.com/tpope/vim-surround'
license=('custom:vim')
groups=('neovim-plugins')
depends=('neovim')
install=nvim-doc.install
source=($pkgname-$pkgver.tar.gz::https://github.com/tpope/${pkgname#neo}/archive/v2.1.tar.gz
        license.txt)
sha256sums=('e8fdc95650e0c3ca61890f6607a21dd01e763a0f2d177f15547afd0adb83ec73'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd ${pkgname#neo}-$pkgver
  local installpath="$pkgdir/usr/share/nvim/runtime"
  install -Dm644 doc/surround.txt "$installpath/doc/surround.txt"
  install -Dm644 plugin/surround.vim "$installpath/plugin/surround.vim"
  install -Dm644 ../license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

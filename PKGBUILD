# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-surround
pkgver=2.2
pkgrel=1
pkgdesc='Provides mappings to easily delete, change, and add paired "surroundings"'
arch=('any')
url='https://github.com/tpope/vim-surround'
license=('custom:vim')
groups=('neovim-plugins')
depends=('neovim')
install=nvim-doc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/tpope/${pkgname#neo}/archive/v${pkgver}.tar.gz"
        license.txt)
sha256sums=('6f775e932650e6a718af7750a7b1d21aef062402f317a49c6a79055f650379c5'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd ${pkgname#neo}-$pkgver
  local installpath="$pkgdir/usr/share/nvim/runtime"
  install -Dm644 doc/surround.txt "$installpath/doc/surround.txt"
  install -Dm644 plugin/surround.vim "$installpath/plugin/surround.vim"
  install -Dm644 ../license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

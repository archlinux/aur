# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>

pkgname=neovim-fugitive
pkgver=2.2
pkgrel=1
pkgdesc="A Git wrapper so awesome, it should be illegal"
arch=('any')
url="https://github.com/tpope/neovim-fugitive"
license=('custom:vim')
groups=('neovim-plugins')
depends=('neovim')
install='nvim-doc.install'
source=("${pkgname}.tar.gz::https://github.com/tpope/${pkgname#neo}/archive/v${pkgver}.tar.gz"
        'license.txt')
sha256sums=('8417dac31c1d444547ac6ae5c016ccafa1f7a061495c2190820d81c8a6244cd0'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd "${pkgname#neo}-$pkgver"

  local installpath="$pkgdir/usr/share/nvim/runtime"
  install -Dm644 doc/fugitive.txt "$installpath/doc/fugitive.txt"
  install -Dm644 plugin/fugitive.vim "$installpath/plugin/fugitive.vim"
  install -Dm644 ../license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>

pkgname=neovim-fugitive
pkgver=3.6
pkgrel=1
pkgdesc="A Git wrapper so awesome, it should be illegal"
arch=('any')
url="https://github.com/tpope/vim-fugitive"
license=('custom:vim')
groups=('neovim-plugins')
depends=('neovim')
install=nvim-doc.install
source=("${pkgname}.tar.gz::https://github.com/tpope/${pkgname#neo}/archive/v${pkgver}.tar.gz"
        'license.txt')
sha256sums=('48f026e41b137c45a31d1ed59a0f1a4f16dd7f4cbb986c7315e23febdbe1dbc3'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd "${pkgname#neo}-$pkgver"

  local _installpath="$pkgdir/usr/share/nvim/runtime"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" autoload doc plugin ftdetect
  install -Dvm644 ../license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

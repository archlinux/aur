# Maintainer: Tyjak <dev@tyjak.net>
pkgname=passdmenu-gen
pkgver=1.0
pkgrel=1
pkgdesc="A dmenu frontend to pass with clipboard, autotype and generate functionality for user and password."
arch=(any)
url="https://github.com/tyjak/passdmenu-gen"
license=('ISC')
conflicts=('passdmenu')
depends=('python' 'xclip' 'dmenu')
optdepends=('xdotool: autotype functionality')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tyjak/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b6fa2f690a88b3f8053817db7932467a48e405b06a9792b1b3715ae74929f4c6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 passdmenu.py "${pkgdir}/usr/bin/passdmenu"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

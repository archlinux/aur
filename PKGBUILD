# Maintainer: Tim-Luca Lagmöller <mail@lagmoellertim.de>
pkgname=rescreen
pkgver=1.0.2
pkgrel=1
pkgdesc="Display Manager with fractional scaling support for X11"
arch=('any')
url="https://github.com/lagmoellertim/rescreen"
license=('MIT')
groups=()
depends=(xorg-xrandr xorg-xev python3 pyside2 python-loguru python-pydantic edid-decode-git)
makedepends=(python-wheel python-setuptools desktop-file-utils)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha512sums=('85e237275214ad6698d2f12ce447fa2e71d8d37f4db2d8f588b7d7fd4817787084b847b4677410c40928c4b31c5117e4c561c8ee9bc7f0f5ece71b5801d7f52c')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
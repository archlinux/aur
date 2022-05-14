# Maintainer: Tim-Luca Lagmöller <mail@lagmoellertim.de>
pkgname=rescreen
pkgver=1.0.3
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
sha512sums=('978dd0338a882827cdec896cf3a28a820e5f755180407775cf25d126db40d65a99ac419ba1bf23cecbbdc8cab40a5885656ba3a51fbce8c0e31076a758c0a603')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
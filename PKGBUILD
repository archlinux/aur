# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubegui
_version=4.4
_patch=.3
pkgver=${_version}${_patch}
pkgrel=2
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' 'cubelib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha256sums=('bf4b0f2ff68507ff82ba24eb4895aed961710dae16d783c222a12f152440cf36')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

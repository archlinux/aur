# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubelib
pkgver=4.4
pkgrel=1
pkgdesc="Library for reading and writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${pkgver}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('9057094c5c28e10b7769d8d33611591273888ce6')
replaces=('cube-perf')

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

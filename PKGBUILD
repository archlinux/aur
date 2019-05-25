# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubelib
_version=4.4
_patch=.3
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Library for reading and writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('5899f2859dc08dd5ab559ead2aed9a5f2d37a582')
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

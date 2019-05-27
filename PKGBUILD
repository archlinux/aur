# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubelib
_version=4.4
_patch=.3
pkgver=${_version}${_patch}
pkgrel=2
pkgdesc="Library for reading and writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('bcd4fa81a5ba37194e590a5d7c3e6c44b448f5e156a175837b77c21206847a8d')
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

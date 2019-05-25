# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubew
_version=4.4
_patch=.2
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="High-performance library for writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('c79e9cedaf11d955be160afa73bf65f8b5b110e0')

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

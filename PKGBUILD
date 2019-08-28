# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubew
_version=4.4
_patch=.3
pkgver=${_version}${_patch}
pkgrel=2
pkgdesc="High-performance library for writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha256sums=('93fff6cc1e8b0780f0171ef5302a2e1a257f99b6383fbfc1b9b82f925ceff501')

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

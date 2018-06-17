# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubegui
pkgver=4.4
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' 'cubelib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${pkgver}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('0bea038f44b60fb6b470b996b0bef23bdc05f68b')

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

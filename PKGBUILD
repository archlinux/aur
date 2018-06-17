# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubew
pkgver=4.4
pkgrel=1
pkgdesc="High-performance library for writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${pkgver}/dist/${pkgname}-${pkgver}.tar.gz)
sha1sums=('df7ded978879812704c1014140e431d32ba6f452')

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

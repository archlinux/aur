# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wminet
pkgver=3.0.0
pkgrel=1
pkgdesc="A dock app for monitoring internet connections"
url="http://www.swanson.ukfsn.org/#wminet"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
source=("http://www.swanson.ukfsn.org/wmdock/wminet-3.0.0.tar.gz")
md5sums=('78a5b269591633e20ced393bc4743f54')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: set sw=2 et:

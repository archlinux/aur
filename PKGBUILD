# Maintainer: Fabrice Aneche <akh@nobugware.com>

pkgname=libfap
pkgver=1.5
pkgrel=1
pkgdesc="Finnish APRS Parser, re-implemented as a C library"
arch=(i686 x86_64 armv7h armv7l aarch64)
url="http://pakettiradio.net/libfap/"
license=('GPL')
source=(
"http://www.pakettiradio.net/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
)
md5sums=('5cd58386eb0a7b2b65f25ae13783e404')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

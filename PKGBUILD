# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.5.0
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
md5sums=('5b2c10b103cf64f33dc7d15c1fb2948f')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

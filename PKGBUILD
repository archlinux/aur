# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.7.0
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
md5sums=('f56a1d5d748f51da8ac47653bca9e2dc')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

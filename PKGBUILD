# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.15.0
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('086dd2e80232d4068ad2e5a0c560d35b13e051d75e36b6318ada88f73ffb9a7e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

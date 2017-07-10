# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.11.1
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(i686 x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=("https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('de37f008fd154bd4b9c3fd7f5b0f13928cd109358d01959a98245fe33d08bf63')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

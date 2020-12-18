# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.19.0
pkgrel=2
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://arblib.org/"
license=(LGPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('0aec6b492b6e9a543bdb3287a91f976951e2ba74fd4de942e692e21f7edbcf13')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

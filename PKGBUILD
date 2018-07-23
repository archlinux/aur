# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=arb
pkgver=2.14.0
pkgrel=1
pkgdesc="C library for arbitrary-precision floating-point ball arithmetic"
arch=(x86_64)
url="http://fredrikj.net/arb/"
license=(GPL)
depends=(flint)
source=($pkgname-$pkgver.tar.gz::"https://github.com/fredrik-johansson/arb/archive/$pkgver.tar.gz")
sha256sums=('bdd28aeea8be133a3a1971bd836d2a5b946cd4dd0c0c695188bd03d1ec119959')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-flint=/usr --with-gmp=/usr --with-mpfr=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

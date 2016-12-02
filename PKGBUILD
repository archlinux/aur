# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=openlibm
pkgver=0.5.4
pkgrel=1
pkgdesc="standalone implementation of C mathematical functions"
arch=(i686 x86_64)
url="https://github.com/JuliaLang/$pkgname"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9a8ae1d17825a4a6a4c013d36a7f4348b27c47eedb6549c521ecc9c79d021c13')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s@/usr/local@/usr@" Make.inc
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libar2simplified
pkgver=1.1
pkgrel=1
pkgdesc="Facade for libar2"
arch=(i686 x86_64)
url="https://github.com/maandree/libar2simplified"
license=('custom:ISC')
depends=(libblake libar2)
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(2aa80e1a4e43dfa8d1f03220f5ee29049ed739e4d740c399d4ac3b9b58409cd4)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

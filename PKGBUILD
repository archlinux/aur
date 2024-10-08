# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsimple
pkgver=1.7
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libsimple"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(a9c3fe9fdf4d5691fc8ef96585a79e031ecf5255cbf6b5dc7eeb53bc7eda8d87553b2da0abf75dde3cbb6999db9dd046a55f03cead018470506b8de9c89238f1)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


check() {
  cd "$srcdir/$pkgname"
  make check
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

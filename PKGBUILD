# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsimple
pkgver=1.4
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libsimple"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(30fd3a5c362e6191913237e449e92b49bdbb3bc2f4f17389d98c04b091e82d69)


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
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

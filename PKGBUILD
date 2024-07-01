# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsimple
pkgver=1.6
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libsimple"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(86e7d021021473c317952fdb9c7afab410881c3365074499396703c3287367537c485d869e2f1c2dbddfbcc2cc6ab8443e8ec74c72f2406efd239ca5d02dea98)


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

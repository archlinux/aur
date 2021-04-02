# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsimple
pkgver=1.2
pkgrel=2
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://github.com/maandree/libsimple"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f98143f218d98f2beb0bd110e1d0210d412db3b5ffe554a32fad4311d4776c58)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CC=cc PREFIX=/usr
}


check() {
  cd "$srcdir/$pkgname-$pkgver"
  make CC=cc check
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

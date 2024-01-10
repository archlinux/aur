# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsimple
pkgver=1.5
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libsimple"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f85a61a85384aa767e48cd64a16c2be02c4e97395d185e7c8fa1f294986109fa)


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

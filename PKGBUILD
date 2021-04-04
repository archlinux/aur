# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsimple
pkgver=1.3
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64)
url="https://github.com/maandree/libsimple"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(88b20cb6afb111ebf0fa89364050b23e6994547df157c268076f1627fe76f9c8)


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
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

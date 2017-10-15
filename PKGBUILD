# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak
pkgver=1.1.3
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('custom:ISC')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils texinfo)
source=(libkeccak-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(642e9beb7b9f860ce22ac98fe401233b694da25ddb8a8670d19372f4cd0e88d5)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk PREFIX=/usr
}


check() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk check
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk PREFIX=/usr DESTDIR="$pkgdir" install
}

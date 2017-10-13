# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libkeccak
pkgver=1.1.2
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('custom:ISC')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(7d6d7aef8e5cbb189a59ecbd096c253e616fba5f15f2af7212f49fbbc9d910f3)


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

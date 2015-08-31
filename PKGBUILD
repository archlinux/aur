# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libkeccak
pkgver=1.1
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('AGPL3')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f8f7382bd2b05a539d29f718a8f2d3b922a852dd588c786d9d841cc8f1b3bb2b)


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


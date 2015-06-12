# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libkeccak
pkgver=0.1
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('AGPL3')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(04be42a6c4b53f9846efb235ecb636ddf0fa63dd33a1f20ea74a24bf74f8c3b3)


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


# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libkeccak
pkgver=1.1.1
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('AGPL3')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils texinfo)
install=libkeccak.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(48eec8cbd3a90f4446d7d04a45e70becad6f3a4e7d156b66746404aeb24603a9)


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


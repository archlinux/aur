# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libkeccak
pkgver=1.0
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('AGPL3')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e6c6987aa9a532b1f49f14c34914ff861c35d749976cc792137fd8c52add1306)


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


# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sha3sum
pkgver=1.0
pkgrel=1
pkgdesc="Keccak-family checksum calculator, including SHA-3"
arch=(i686 x86_64)
url="https://github.com/maandree/sha3sum"
license=('AGPL3')
depends=(libkeccak argparser glibc)
makedepends=(libkeccak argparser glibc auto-auto-complete texman sed texinfo)
install=sha3sum.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(d4f4729f6065c489d6ed95e1c997e1bda4308ba37ebb3eb8a666fef17d4fc22f)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr command shell info man
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install-base install-shell install-info install-man
}


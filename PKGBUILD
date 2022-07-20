# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=krandom
pkgver=2.0.1
pkgrel=1
pkgdesc="Keccak-based userspace pseudorandom number generator"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/krandom"
license=('custom:ISC')
depends=()
makedepends=(libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(210078159eb10af4bed984b05caded07d496741b61302999341f937acde00cbe)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

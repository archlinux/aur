# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=krandom
pkgver=2.0
pkgrel=1
pkgdesc="Keccak-based userspace pseudorandom number generator"
arch=(i686 x86_64)
url="https://github.com/maandree/krandom"
license=('custom:ISC')
depends=()
makedepends=(libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(db97f128ecb45d645bc0e54ad8a4cb278f82ef71057d9a8339624156bc1e16ee)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr install DESTDIR="$pkgdir"
}

# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=krandom
pkgver=2.0.1
pkgrel=1
pkgdesc="Keccak-based userspace pseudorandom number generator"
arch=(i686 x86_64)
url="https://github.com/maandree/krandom"
license=('custom:ISC')
depends=()
makedepends=(libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b4cd00d1d4b60c3e9aa44e89bdd4db218bdb88371a23ea54ab00ffce643c241f)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

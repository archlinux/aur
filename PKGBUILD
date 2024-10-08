# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=krandom
pkgver=2.0.2
pkgrel=1
pkgdesc="Keccak-based userspace pseudorandom number generator"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/krandom"
license=('custom:ISC')
depends=()
makedepends=(libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(6dca1fd6767a20e2a7ae97d62c10790c76337c190223ca714fd3145f96d2dd0e4e45832168c1dd796b204200df0cdafad4caeaaafb0b73d32deb6e332375024d)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

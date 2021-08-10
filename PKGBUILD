# Maintainer: tywyqu <tywyqu at hi2 dot in>

pkgname=storj-uplink-c
_basename=uplink-c
pkgver=1.2.3
pkgrel=1
pkgdesc="Storj Tardigrade Uplink-C"
arch=('x86_64')
url="https://github.com/storj/uplink-c"
license=(' AGPL-3.0')
source=("https://github.com/storj/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')

sha256sums=('1ead521f53fbc7cfd43adfac7dfa2d97365bc6683d90b3df1d3950480a234094')

build() {
    cd "$_basename-$pkgver"
    make build
}

package() {
    cd "$_basename-$pkgver"
    make install DESTDIR="$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: tywyqu <tywyqu at hi2 dot in>

pkgname=storj-uplink-c
_basename=uplink-c
pkgver=1.5.1
pkgrel=1
pkgdesc="Storj Tardigrade Uplink-C"
arch=('x86_64')
url="https://github.com/storj/uplink-c"
license=(' AGPL-3.0')
source=("https://github.com/storj/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('f96325d25a5d3bfa2c608c142821637d9ffbf87da838482781b95bcb5d3bb082')

build() {
    cd "$_basename-$pkgver"
    make build
}

package() {
    cd "$_basename-$pkgver"
    make install DESTDIR="$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

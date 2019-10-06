# Maintainer: Daniel Roe <daniel@concision.co.uk>
# Maintainer: Austin Pray <austin@austinpray.com>
pkgname=trellis-cli
pkgver=0.6.2
pkgrel=1
pkgdesc="A CLI to manage Trellis projects."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/roots/trellis-cli"
license=('MIT')
depends=(
    'go-pie>=1.11'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roots/trellis-cli/archive/v${pkgver}.tar.gz")
sha1sums=('4548a62b7ea346ab8885e8c59cefd4e52c06c70a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    cp trellis-cli $pkgdir/usr/bin/trellis
}

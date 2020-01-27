# Maintainer: Daniel Roe <daniel@concision.co.uk>
# Maintainer: Austin Pray <austin@austinpray.com>
pkgname=trellis-cli
pkgver=0.7.1
pkgrel=0
pkgdesc="A CLI to manage Trellis projects."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/roots/trellis-cli"
license=('MIT')
depends=(
    'go-pie>=1.11'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roots/trellis-cli/archive/v${pkgver}.tar.gz")
sha1sums=('4a17e3cc27276c5c9d44043bd35608de5bc72a0a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    cp trellis-cli $pkgdir/usr/bin/trellis
}

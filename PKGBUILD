# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=rtcp
pkgver=2
pkgrel=1
pkgdesc="A simple reverse tcp and socks5 proxy"
arch=('x86_64')
url='https://git.sr.ht/~rumpelsepp/rtcp'
license=('GPL')
makedepends=('go-pie')
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c5222eae45df6d9eccab289c4b86d575759970adb62ddce8c38ccbffeede009c')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    go build .
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

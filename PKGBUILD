# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=rtcp
pkgver=3
pkgrel=1
pkgdesc="A simple reverse tcp and socks5 proxy"
arch=('x86_64')
url='https://git.sr.ht/~rumpelsepp/rtcp'
license=('GPL')
makedepends=('go-pie')
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('710601616587fdf423c6025b434c8ad61bec5b05bfba5247d02452ca83e76069')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    go build .
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

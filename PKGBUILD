# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=rtcp
pkgver=1
pkgrel=1
pkgdesc="A simple reverse tcp proxy"
arch=('x86_64')
url='https://git.sr.ht/~rumpelsepp/rtcp'
license=('GPL')
makedepends=('go-pie')
source=("$pkgname-v$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('17c13cfd6b6af17d55cf5118b9d645ced305a4ebac3a0a449e03a6a0921a0b8d')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    go build .
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx
pkgver=2.1.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx-bin')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/byteowlz/sx/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o sx .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 sx "${pkgdir}/usr/bin/sx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

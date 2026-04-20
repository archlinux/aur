# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=hcl2json
pkgver=0.6.9
pkgrel=1
pkgdesc="Convert hcl2 to json"
arch=('x86_64' 'aarch64')
url="https://github.com/tmccombs/hcl2json"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("https://github.com/tmccombs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df7361e4ea5f34de02a81afa06f515bc6379efeb5ab86c154c6a31def6bcb3dc')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -buildmode=pie
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin/" hcl2json
}

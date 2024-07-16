# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.15.0
pkgrel=1
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/cloudentity/oauth2c"
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    go build .
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=('d75acbe4b456b30803aafab046270b07f1ea9ba76e525c671d2c83a93448e85f')

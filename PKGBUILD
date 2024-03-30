# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.13.0
pkgrel=3
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/cloudentity/oauth2c"
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}"
    go build .
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=('f5545e9aca8c79042080e8510ec77ac66ed3ac4acf976a8bbeb53e04fae02630')

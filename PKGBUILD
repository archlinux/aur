# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.20.0
pkgrel=1
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/SecureAuthCorp/oauth2c"
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('36606ec1c5eca7c7fff6bb87d4171031ddc5bfb93474eaf97191fe16b9902f24')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v -o $pkgname .
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

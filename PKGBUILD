# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.21.1
pkgrel=1
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/SecureAuthCorp/oauth2c"
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('8f033f91e14bddc3ff3ae2c7cdf804f4e794d94dfa0e9ef4751d9b9d9cd212c4')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v -o $pkgname .
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

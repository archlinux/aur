# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.21.0
pkgrel=1
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/SecureAuthCorp/oauth2c"
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('f03ec7b08fa9612f8196d236658f6aaa3245ddd1cab6aa94a086fe5d938a0bfc')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v -o $pkgname .
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

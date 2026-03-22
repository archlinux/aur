# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=tdocker
pkgver=0.5.1
pkgrel=1
pkgdesc='A minimalistic terminal UI for everyday Docker operations'
arch=('x86_64')
url="https://github.com/pivovarit/tdocker"
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('7472cacf0bdd9b4addf1114034ce0271b099cbbc9e0373f2b420a7d54a2cbe2a')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v -o $pkgname .
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

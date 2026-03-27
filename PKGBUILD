# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=tdocker
pkgver=0.5.2
pkgrel=1
pkgdesc='A minimalistic terminal UI for everyday Docker operations'
arch=('x86_64')
url="https://github.com/pivovarit/tdocker"
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('go')
sha256sums=('bd8e498e5c7406fc6a09aac9f027140496ee6eaa0531057c529a9daa5af4e083')

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

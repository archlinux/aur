# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gorss
pkgver=0.5
pkgrel=1
pkgdesc="Go Terminal Feed Reader"
arch=('x86_64')
url="https://github.com/Lallassu/gorss"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('03c34b96482b8a6cc8a80546c0dd3232cfdf6c25928c05253da21177b2f16abb')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
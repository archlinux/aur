# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gorss-bin
pkgver=0.5
pkgrel=1
pkgdesc="Go Terminal Feed Reader.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Lallassu/gorss"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lallassu/gorss/v${pkgver}/LICENSE"
)
sha256sums=('a85b1d83c0598ffb73f4c21afcf68c0ab4a12b2e2f84aaa6c338927c96a9d41f'
            'b259599c27ef3ad3ad88ca16614e05831c36d000d14cfa5ddc4cc9b7a7931d8d')
package() {
    install -Dm755 -d "${pkgdir}/usr/"{lib/"${pkgname%-bin}",bin}
    cp -r "${srcdir}/dist/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}_linux" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

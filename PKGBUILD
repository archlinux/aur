# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gorss
pkgver=0.4
pkgrel=2
pkgdesc="Go Terminal Feed Reader"
arch=('x86_64')
url="https://github.com/Lallassu/gorss"
license=('MIT')
depends=('glibc')
provides=()
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_linux.tar.gz"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('e8a58474803e33a096c79bfcd397715a5949071f9cbf3e1d0a2b8a9381a98672'
            'b259599c27ef3ad3ad88ca16614e05831c36d000d14cfa5ddc4cc9b7a7931d8d')
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin/"
    mv "${srcdir}/dist" "${pkgdir}/opt/${pkgname}"
    ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}_liunux" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=medict-bin
_pkgname=Medict
pkgver=3.1.13
pkgrel=1
pkgdesc="A cross platform dictionary application,support mdict (*.mdx/*.mdd) dictionary format.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/terasum/medict"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_${CARCH}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/terasum/medict/v${pkgver}/build/assets/darwin/appicon.png"
    "${pkgname%-bin}.desktop"
)
sha256sums=('0fee51b1d95331ba44519dc99a9b92194402af1b99224d3a0b36474561ae1326'
            'feafee440d86c5abd9d525ee78102209125c4d6e4275e99b6d4452fdc2f1995c'
            '69b834c6671635d01a6b806c2b8c00290c07ab7dfd331f8d9a776beab79e3fc7')
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
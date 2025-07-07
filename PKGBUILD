# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krowbar-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="BSPWM status bar.Prebuilt version."
arch=("x86_64")
url="https://github.com/bloznelis/krowbar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk4'
    'alsa-lib'
    'gdk-pixbuf2'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}-linux-gnu.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bloznelis/krowbar/${pkgver}/LICENSE"
)
sha256sums=('e0b1df908aa56b0eb99060cd7865ded4f188189d04065705580a29e30cd8c1f8'
            'd3d911835f6302d517d6e5afdd0200df59f954610876f0e66e427c0ceea194ed')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}-linux-gnu/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

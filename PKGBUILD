# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krowbar-bin
pkgver=1.4.0
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
sha256sums=('99c75c718f3ad9d42be72ce086c6e6f574e92bbec17e4300867cbe915b655ffe'
            'd3d911835f6302d517d6e5afdd0200df59f954610876f0e66e427c0ceea194ed')
package() {
    find "${srcdir}" -type f -name "${pkgname%-bin}" -exec install -Dm755 -t "${pkgdir}/usr/bin" {} +
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
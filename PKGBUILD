# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krowbar-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="BSPWM status bar.Prebuilt version."
arch=("x86_64")
url="https://github.com/bloznelis/krowbar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk4'
    'gdk-pixbuf2'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}-linux-gnu.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bloznelis/krowbar/${pkgver}/LICENSE"
)
sha256sums=('5c39eb5545453ab2120b019c47c6aa95dec6e55b93c9de6732e387e9d79b3d8a'
            'd3d911835f6302d517d6e5afdd0200df59f954610876f0e66e427c0ceea194ed')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}-linux-gnu/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
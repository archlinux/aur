# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godoos-bin
_pkgname=GodoOS
pkgver=1.0.5
pkgrel=1
pkgdesc="An efficient intranet office platform that includes various tools such as Word, Excel, PPT, PDF, intranet chat, whiteboard, and mind mapping, and supports native file storage."
arch=(
    'aarch64'
    'x86_64'
)
url="https://godoos.com/home/os/"
_ghurl="https://github.com/phpk/godoos"
_gturl="https://gitee.com/godoos/godoos"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "LICENSE-${pkgver}::${_gturl}/raw/v${pkgver}/LICENSE"
    "README-${pkgver}.en.md::${_gturl}/raw/v${pkgver}/README.en.md"
    "README-${pkgver}.zhs.md::${_gturl}/raw/v${pkgver}/README.md"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::https://godoos.com/upload/${pkgname%-bin}/${pkgver}/web/${pkgname%-bin}_web_linux_arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::https://godoos.com/upload/${pkgname%-bin}/${pkgver}/web/${pkgname%-bin}_web_linux_amd64")
sha256sums=('13fb48a6c31a72e0e2b69650b1cebe8954f7b73449848492dcfd22b25bd91afa'
            '3d0df5272c4b4c94a859eaa74022934a1239ba1f9b6445bc91e53a8e7b11e361'
            '3f0a57e751c9352cd03afa60ecad878d3ffd2243586a0e4ad991886916dee180')
sha256sums_aarch64=('01cf0a81e8f16ddeba510b0ac9465a54aa67961c3a280ee8006d56772fa5ec0c')
sha256sums_x86_64=('0edb476ab2b2287c2b0b22c8922df94d11c9fd020a89f7c67a0bb11da43fc06e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.en.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.en.md"
    install -Dm644 "${srcdir}/README-${pkgver}.zhs.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
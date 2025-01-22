# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-infra-guard-bin
_pkgname=AI-Infra-Guard
pkgver=0.0.2
pkgrel=1
pkgdesc="AI infrastructure security assessment tool designed to discover and detect potential security risks in AI systems.(Written in Go,prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/Tencent/AI-Infra-Guard"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('0805c08ca54f26cabf2ffc9a9fd0460aca17a5a891d7da808fd5610c12737381')
sha256sums_armv7h=('86f512575f49c58b29c284b2a1cccba192b1237ec21c88b74c920e00d9c96d4a')
sha256sums_i686=('3fbeb97a461dbce5129b38a300ba1c7eb98a9b1a2b54f2db95aaf2a6aed73c10')
sha256sums_x86_64=('544966ff8a42565802078b8ed21f4fa00ba7e383d5d03f401926583a6983c0b2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/data" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

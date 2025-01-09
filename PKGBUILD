# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-infra-guard-bin
_pkgname=AI-Infra-Guard
pkgver=0.0.1
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
sha256sums_aarch64=('27c9c4022d370a89e0e44402b5114d1bb957d636095b497cd1d89bd1d2ce70c1')
sha256sums_armv7h=('bc2cb220c539dc32148ccf1e98e634e990ca58ad859b412a962f5bbada3dc99b')
sha256sums_i686=('6dc7ff57e41eb8e07f26860d042d911baffdbeef76b8ffb43f0f48a25dbc03d3')
sha256sums_x86_64=('10069e052b641c7af287e146213b44a7d71748041d1e24715bdc115b52bfaaec')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/data" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
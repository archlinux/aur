# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>
pkgname=codegpt-bin
_pkgname=CodeGPT
pkgver=1.7.2
pkgrel=1
pkgdesc="A CLI written in Go language that writes git commit messages or do a code review brief for you using ChatGPT AI (gpt-4, gpt-3.5-turbo model) and automatically installs a git prepare-commit-msg hook"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/appleboy/CodeGPT"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/appleboy/CodeGPT/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.xz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm-7.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.xz")
sha256sums=('11d290bc694f8f7fa7393406a3b47c0f51c06093634c6e24c21bb6dd74e5874b')
sha256sums_aarch64=('e9e602eee951bbc77ae4987d45a2163e043dc7ac56521baeead6416f9cdd2c09')
sha256sums_armv7h=('9c615a3bf980dc5fe24b135696b1becb517556209379ccea188d3c1787cab725')
sha256sums_x86_64=('75f083a8c98e391c9334c841fda1acfe65961ef055e878bef895ee13f4a17d30')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

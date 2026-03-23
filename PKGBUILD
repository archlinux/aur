# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>
pkgname=codegpt-bin
_pkgname=CodeGPT
pkgver=1.7.1
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
sha256sums_aarch64=('ccd434bcda94e73ec84f0f2dd3cfbbc7dd4a49de074ea58a3a1ab12075ed7b65')
sha256sums_armv7h=('113ed99406da6faf67b0df2a34c7290b5ed23c222085e4581109f2dc3022e742')
sha256sums_x86_64=('6980bf14c292d321b3a6e39f5e299f84e441368e5bfd11f99f92bd5c18865989')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

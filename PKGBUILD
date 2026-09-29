# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>
pkgname=codegpt-bin
_pkgname=CodeGPT
pkgver=1.8.0
pkgrel=1
pkgdesc="A CLI written in Go language that writes git commit messages or do a code review brief for you using ChatGPT AI (gpt-4.1, gpt-4o model) and automatically installs a git prepare-commit-msg hook."
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
sha256sums_aarch64=('0e0cab944fde6a2e22b78e4942d6f352d36f25ee6090fd5f1c35585844531901')
sha256sums_armv7h=('cce15a3498ae7dd041a6bb343e3d5072e610a3cee9a6c16773f56b6a56618e9c')
sha256sums_x86_64=('a4311f926954e5bb954ca6e7f4e600042875bdd776944972284bb126c9ac5923')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>
pkgname=codegpt-bin
_pkgname=CodeGPT
pkgver=0.14.4
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
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/appleboy/CodeGPT/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.xz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm-7.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.xz")
sha256sums=('11d290bc694f8f7fa7393406a3b47c0f51c06093634c6e24c21bb6dd74e5874b')
sha256sums_aarch64=('902d789063b92ba176b78d143d4d8e64bdcc7694fae8c806b566288a09aa57e9')
sha256sums_armv7h=('ab70101531e13a7c207434aed1ecc1d3f2ed5afa6419f364f9912d8d9d32a8c3')
sha256sums_x86_64=('263ca5d8e5faf290177e5182ed6e4c424034f748e7e2ce8c9b889bc836a693de')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
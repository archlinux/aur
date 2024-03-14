# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=codegpt
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A CLI written in Go language that writes git commit messages or do a code review brief for you using ChatGPT AI (gpt-4, gpt-3.5-turbo model) and automatically installs a git prepare-commit-msg hook"
arch=('x86_64' 'aarch64')
url='https://github.com/appleboy/CodeGPT'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
source=(
    "https://raw.githubusercontent.com/appleboy/CodeGPT/main/LICENSE"
)
source_x86_64=("${_pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/CodeGPT-${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/CodeGPT-${pkgver}-linux-arm64")
sha256sums=(
    "SKIP"
)
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "$srcdir/${_pkgname}-$CARCH-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

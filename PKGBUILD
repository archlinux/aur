# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=minify-bin
pkgver=2.24.3
pkgrel=2
pkgdesc="Go minifiers for web formats.(Prebuilt version)"
arch=(
    'x86_64'
    'aarch64'
)
url="https://go.tacodewolff.nl/minify"
_ghurl="https://github.com/tdewolff/minify"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'bash: For auto-completions'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums_aarch64=('d41c0aa03c5c6137437f4cae01a2d9b3399ade79669bda0e8912edd904c153e7')
sha256sums_x86_64=('01ce362f56ad4187bd106bec5311f421083b3942c3a3f2d866c6b3d508101d9a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
}
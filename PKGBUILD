# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=minify-bin
pkgver=2.24.22
pkgrel=1
pkgdesc="Go minifiers for web formats."
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
sha256sums_x86_64=('5461c94e3f03ae76df86cf4cb22d1462247a889d42f75d749557f6b83efd3f02')
sha256sums_aarch64=('0c9db15257406528d0bbcbd8682b089b13e80929e19ed3e24ad36c8a96a83712')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
}

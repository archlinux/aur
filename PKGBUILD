# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=minify-bin
pkgver=2.23.8
pkgrel=1
pkgdesc="Go minifiers for web formats.(Prebuilt version)"
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/tdewolff/minify'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'bash: For auto-completions'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums_x86_64=('54e1b22625fa36450e549a5052c13d53001b0b47ba3bdccfd5cf95cd3654ef58')
sha256sums_aarch64=('d0888b30c25c041707b3b605351fcc8316f1875af61909d9645eb28d5437c72a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
}

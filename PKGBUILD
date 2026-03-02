# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=minify-bin
pkgver=2.24.10
pkgrel=1
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
sha256sums_x86_64=('f673555cefeef2c2feefcc49f464dee5043f43609f8b1117960047047bae02aa')
sha256sums_aarch64=('342ce8431e5cf012b7aa3fc01302a132281ad0b6758c5da929f2a5bbb152f4e4')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
}

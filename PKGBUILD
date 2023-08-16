# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=minify-bin
pkgver=2.12.8
pkgrel=2
pkgdesc="Go minifiers for web formats"
arch=('x86_64' 'aarch64')
url='https://github.com/tdewolff/minify'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=('bash: For auto-completions')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums_x86_64=('ab4086acd75d0a80cb98d6c56cc851b8389b90cb666539e8f5db512be7a37c42')
sha256sums_aarch64=('ee12e4158a68b6bd7c27d999b0761d6eb7816692c0074bc0dfab20644b3239d9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
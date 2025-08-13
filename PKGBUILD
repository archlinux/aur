# Maintainer: pudgala

pkgname=chatgpt-cli
_pkgname=chatgpt
provides=('chatgpt-cli')
pkgver=1.8.7
pkgrel=1
pkgdesc='ChatGPT CLI provides a powerful command-line interface for seamless interaction with ChatGPT models via OpenAI and Azure, featuring streaming capabilities and extensive configuration options.'
arch=('x86_64')
url='https://github.com/kardolus/chatgpt-cli'
license=('unknown')
options=(!strip)
# https://github.com/kardolus/chatgpt-cli/releases/download/v1.8.7/chatgpt-linux-amd64
source=("${pkgname}_${pkgver}_linux_amd64::https://github.com/kardolus/chatgpt-cli/releases/download/v${pkgver}/chatgpt-linux-amd64")
noextract=("${pkgname}_${pkgver}_linux_amd64")
sha512sums=('4c1e53fbe2f9aebe2f7aba53ed26bb3c8a4c307277a52aad4cad3f257897f7276e8f2dcc8b0b2e4484c19ba17b2fda201b2411be3a68509d16a11a376f2f1b9a')

package() {
    install -Dm755 "${srcdir}/${pkgname}_${pkgver}_linux_amd64" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    # ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}


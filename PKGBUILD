# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=kdigger

pkgname=kdigger-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Kubernetes focused container assessment and context discovery tool for penetration testing.'
arch=('x86_64')
url='https://github.com/quarkslab/kdigger'
license=('Apache 2')
provides=('kdigger-bin')
source=("https://github.com/quarkslab/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz"
        "https://raw.githubusercontent.com/quarkslab/${_pkgname}/v${pkgver}/LICENSE"
)
sha256sums=('220d0c4c909612c4ced27d65cf6c434446d736bcae5b51890470938679198b8c'
            '164b5d6e11ccd0454ddb48f9f57de8785853e1714b267c319784b4be673febeb')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

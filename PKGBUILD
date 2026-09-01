# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.539.0
epoch=1
pkgrel=1

pkgdesc="Language server that enables an IDE to integrate with GitHub Copilot."

arch=('aarch64' 'x86_64')
url="https://www.npmjs.com/package/@github/${_appname}"

license=('MIT')

source=("https://raw.githubusercontent.com/github/copilot-language-server-release/refs/tags/${pkgver}/LICENSE")
source_aarch64=("https://github.com/github/copilot-language-server-release/releases/download/${pkgver}/${_appname}-linux-arm64-${pkgver}.zip")
source_x86_64=("https://github.com/github/copilot-language-server-release/releases/download/${pkgver}/${_appname}-linux-x64-${pkgver}.zip")
sha256sums=('9e48ecfa18e2b15169746a3c97beda4d1d6c6796097038498ca434ca7e0ccd44')
sha256sums_aarch64=('610aec6908abb1bbe72b43604f31c501489000f3018576e4f7c1262e9711b388')
sha256sums_x86_64=('a5f8a02bd262362017c0aaf4faacb32e0f10dbd7e58469ac1e4211fa24a903b4')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('84ca824bd90100561a113aa71dfd393bef168e53fb7165074ccd8ea5e646170b75b826fd529efbebc431db9c58683e44287d4a1e1c4ad20467f123f3a85cff2d')
b2sums_x86_64=('2f986397aa4070d1d3da4b8d9fb6112305605ac000d8968dcfcbcdb8c8ab6e9f7f3d8d2ce544355f74f903282444ce3438db01a5f077fa2fb6efd0c0286f4661')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

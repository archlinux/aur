# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.537.0
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
sha256sums_aarch64=('13a85bea3209fd34277b536ebd80a214137bdfc2eebd60e1a7f59daaf7f9836a')
sha256sums_x86_64=('c64eb62ec79b887978037fdd1dcf892f96050d7157f5a10349f4c7536ee1ad6d')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('af98a4af4044a59271c947fada0084e80495ef767b4b33bc1fb49575f3f508c3036e067badf215c071f367ca807ec861a04c747b1f6b86657179c85575b4fa03')
b2sums_x86_64=('e2575098579e52c6eb3f4253e56be6a88ce9f8e041c5175abc27f92a24ac85d3311469f26d5893248a2b86e8af620c4aa0cd247629f7a7d2f216c77fd6e51fc7')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

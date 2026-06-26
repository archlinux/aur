# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.513.0
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
sha256sums_aarch64=('50a6efe9e6eb35f09624731b922c98a7e8d5f4fce81de2cbfc20e3a0aa62321a')
sha256sums_x86_64=('485181b76e35e964f1fe9fb6ecaf27a0fc2ed2f143b39cd77ee13360811e1bb8')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('9899f8f217b92af89e355e8f074a115fa4369a3cb72bbb9eefb5859110d65591a2af6c8599f178062dc7145aa19f5d8ce249ed15a3598ded7e6742e44a73e57b')
b2sums_x86_64=('2f88fd4c1559a5ead53dc5ef256e99a95ca786153455a0b2697df52a686a12bc4a72f8fc0a936d97421063b4870ea9b9e94b27d57a3cfe024eaf41f5adf053af')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

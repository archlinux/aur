# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.516.0
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
sha256sums_aarch64=('3386232d6a18c7523d97176e62b96ee0ca9bf905853a29d5ec67afa4982e0836')
sha256sums_x86_64=('2da0c422fa78d8265c97329251f3f7f8984c7b81cf368d2123653d7c9ae6e2bb')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('fff129a9c7b70307ed91f81211efa86a3442eee1174570ede1355a12da333b4e51709b532b4a1c14a2a1abd66ef61c5743d1432fedaa0c8cb4de697ef802d8b1')
b2sums_x86_64=('47424ae3e5140489f21927e28c4a3ea34144596238e58c7cf35aba281f02257c379652a2f59b3cbf41cdbb6c2b5cc494c798c8c7ba840d68f7ed13c34b14dc8c')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

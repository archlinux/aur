# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.506.0
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
sha256sums_aarch64=('6c486cf71e65fecbc24ce3029c7f8a23b1bce53c7e8c8c86434549064ad68dfa')
sha256sums_x86_64=('35392a8242e5cd489e4fe16fdacc3ce9684acc0a07e6381157813d16afe88759')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('b12594dd5df558d67e08ab484e7c0d7d445764f98acaec0d3f47ddd0dfd0680b742dbfd83dee27410f79a6bea6e5323a7169134165a79ee981c0e8931adb01f1')
b2sums_x86_64=('8cd6f604333da47814ff86b8dbacd921308afb259fc3b0abe781b9c69bb5f932e1ae73afaaa0734e5bb3ef1223bf840e82c4d75bf82448487a4a0e46af39cd15')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

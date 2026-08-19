# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.533.0
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
sha256sums_aarch64=('6e6605f5da9b4a36defe8283baa71fb99942f592fd99935386bffa99e2146a74')
sha256sums_x86_64=('2b012bcee1d774be13fbce05e71cf9b9c0f0f78ab9f7d9cc8f1b14dd13842f16')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('c4d97c89f7b40fda9d4b5e9680c83a04dcbb4d120b6ce6c4807b953959e2fd885be5cad80514aac876db0f6c8ac20aa20446ba59136a96f256f48b46b6fc92e0')
b2sums_x86_64=('b7aa11aae473c4a172fa93726698db60edb21f8e0faa3a1fbb17074427df2785db570f6a2607bab1520b6151e70349d2465e4f4c35907fe7b2af3f71a7710718')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

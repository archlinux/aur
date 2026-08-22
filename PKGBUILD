# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.534.0
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
sha256sums_aarch64=('2e20e6b177b46f559c6e48b40c7b7c30a55bf9c0aea14b80a653409861744370')
sha256sums_x86_64=('27cca080df4d911b3d282523ff54df43f52a7d7709b490025352742a5519a257')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('a2c4bed2c338fb394da1ccdbd98d29460ac13cdac26f2e060afa55283e11ce3d3d5039bbb4d9d8919026eea9d52ce7952c9da643bbc3fc6d78c7a5f6c8fbae4e')
b2sums_x86_64=('1cfb283d8c013c2cdad49bf8a3ab2ab996deed19e3d11bdfd9b7c939e8e975324327d2f54f6e706de435e12f69125c970a8b26ff86818d3e9ae24da8a55e11dd')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

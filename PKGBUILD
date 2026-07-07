# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.519.0
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
sha256sums_aarch64=('a5eb1632ce2103cf24354cd338e4237c5b0a17a94ff29f4fff04e9199f76a094')
sha256sums_x86_64=('2f73ef9b30909f1ce79cfd18e1c230186918161eb35c31a162f1b03d4b150b3a')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('086aeed42dac1dd66bcf24f4feb20798f00bc88224bb1e56aaaf35ea42d0f0fe19cef3d0aee4379bae41d91831e34cc4df0527187ea1d4f5331e90b205139176')
b2sums_x86_64=('d36c4124256668bfbb467a6a6e45ef40874b6862e99650c534bab420fb0e178dbd7ff32858a417db793aa2f6788bc446c03c71c09e50abf9e6d8da4eaab6a69e')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

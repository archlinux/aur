# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.542.0
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
sha256sums_aarch64=('2a2d326068b6cbd6b97af3c6f53f274db4e3f5e0e966f2395b382374cb06e4c8')
sha256sums_x86_64=('2bc7d9001ac3cf162709c6e09ffdab1e7cd56e363ed11211d0c86a3b92b7c1f1')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('415a99753079715afbcccb3ccedf75aaec4bdc0893bec2c644ffc208873d5896cef2e6c5866959763d2d62f2f58447d6032b9d24527086eff100ee4949a251b7')
b2sums_x86_64=('f229bcd07534156dc0c0669e9eab217364ad9eb089a60db1d456a30f741bef8873d97126aff4405ef61f14fdc4259527bad94c3f9dc062431e231e2a3eb4c757')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

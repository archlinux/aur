# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.545.0
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
sha256sums_aarch64=('fffe8186b26b661d03f12fd909d2e19f53feea8a6c6160ae3968b9d6fc70246b')
sha256sums_x86_64=('8cd23a68de4676340b12605f9efa734ff9989df26e753aa8305a16bd0bff885b')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('b215f0783a45b772c2dfc42c6805d82fd9e44ff9fd434b176f726c1ff3f7600953b37c6a18747714fe9164372ee221e24129e8ee1542c5bf0439552d5615e768')
b2sums_x86_64=('753c8faff5c8edaaea4e3cd9b36e5c43a73baf696785a6e20b927c69b14b7b13ddfab376fb422d2ec941b3195b8d25d39e1564d0260a83483ad96dc1273113fd')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

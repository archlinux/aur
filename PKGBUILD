# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.526.0
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
sha256sums_aarch64=('47e51d46d18f3622a316f61854c745d5c7dff5b267acef65e57cc8d4d22bed3a')
sha256sums_x86_64=('5b88212935c0fc04954d9c6feee108dba6cb82fa0dfe96ad09e4b27c5d113607')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('3a947a78997eb5e31a05796b8523e8519c428d8b2a1983c61bd1184ac41408c985fddec18300aef5c2a6f99995ce4fdcaf38d746e1e5517e5fd60a3892df1d78')
b2sums_x86_64=('bd0e22b38f344b083a97b6f8947363814f538c753ea4374a5a792fa754aae2afb7d605f4bde7f802070f4658ccb73025e6a69186d27eae3688d750ef78482a02')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

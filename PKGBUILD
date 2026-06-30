# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.515.0
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
sha256sums_aarch64=('0a439d2ca3b69a69c1bf6a19ca0bed0b1bbcc7aeb9aa2951f011959f563b7b96')
sha256sums_x86_64=('e07f9022f2a4334c8f5356f9eb4a398592d60b1c22e91fb04075d4edc6034fe3')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('d04912a5e5f4379fa07e3feefbf22e75b5ee9429d63a35045f66e6dd93624c810c84cb0eb3e352b9da3f61ab2190e09e0d86e0b928348fb192cb742b08d91896')
b2sums_x86_64=('bc0436cad0917a4fbd9696fc6036339a6c109faec16d66384c551df7d06de12893ccb22b42cd6276708239635e35116539ac1fffa515af84334072430314c836')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

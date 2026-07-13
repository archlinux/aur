# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.521.0
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
sha256sums_aarch64=('0962e3be99cf4f226142bc1f457e399922190eb341e766a3e9d245ed3d64dde2')
sha256sums_x86_64=('3728ea79ad2276141beeced84158bee40a8f19a88d75d4b860ecca91899220db')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('3d76a5a18ccb83f3c4d6eb24fa1eb5e401d60941b39b76736dca050910d78e937a240fa5051409ba908ced7ed3f1754eaf6178f090cafa33b48cf08f73223d21')
b2sums_x86_64=('99b4af7df99f54208163c19cec96c563b26952c0a83c06bdd8445ebe88dd06ecef0740efa949e2cd25b515acd7dc938a0e588b44b59fa059ea56402239399e08')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

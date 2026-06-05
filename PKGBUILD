# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.503.0
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
sha256sums_aarch64=('9ba1c5b360adb911e2d5fc0808c13511d0df919ce04eb309115479bfb2824256')
sha256sums_x86_64=('f9b65f8ede2af85c53fb35ab007e27130a6e83e3f89b7bd802031fb34145193c')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('52a25fb9965df74e9fbef9ce12f90cf807f7c67ce1baaa304d328bc5704e33c3b84b7339dad0458828ed8ce28ef8bb6cd7a2f7472c75e609c63fe9cf52d5e34b')
b2sums_x86_64=('7e8dd6fad001f12c8c9ec38ff95594e751a30882205b7035772bd8e2afde008c9b59877e7251dc9835732b4bd16cd8a74b292d8a6dbdc594c7689e87f3c98d9a')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

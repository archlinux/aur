# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.531.0
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
sha256sums_aarch64=('e0a30bd7de0956e11ca982ee09d9f698eac780f5336f061dee6e6ee2edcde4fc')
sha256sums_x86_64=('7c5ca824c4a8f10583199aa014db21c55ff7cc9e55cb408dc7429d5b42f88a7b')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('d5a03d3042737f6ef26733db1a734ab45c5320c5d38c1588aa604478a21d17564597cb22d9735aa6c5ff01b62be56f56e9456902f7b7c23f75553af2a73c7ab2')
b2sums_x86_64=('cf126d2b6073732c63cce2a6425fc0086436d8d90f3371aac8a5e867a4276eff142726c6dbb3c062fb54aa4129b0a5556a56fc4c693a2c98c1c69601564aab8e')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

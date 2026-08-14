# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.532.0
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
sha256sums_aarch64=('2f246da1970cf4a505722ce6fb0a1a6d00a1539886b1dbe7cf31204d75e871e7')
sha256sums_x86_64=('5b3fece111898a3ac3a167cdc9ddf47f78bd6855f35fa5e627b00a50efc28d7a')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('6ceb6d3458c4dc2612c57ab326ebf13666cb6753d1d3116382ba53f720d4bd580149ed8fcebfd8f48f8186b985793c6b0ddf580bfcc45e71a0dda1a0bf4b4592')
b2sums_x86_64=('b0184dd82c84a3a61c86bb717dec7c7a883893de0fcc7bb49c97689c3ea91da46a604efa94c96619e2ebf5c77d53067fa7e24d75e5ddf0f4838ebeb9b25bd61a')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

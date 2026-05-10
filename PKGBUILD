# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.485.0
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
sha256sums_aarch64=('b6143cc365e8618a343bce99907a9af70dd7a3fc5d83633579549e8c5d4a87f0')
sha256sums_x86_64=('e60e5b83a3078b1722cc6efc2291fe491d9a6bb22df0c49f4278cd5c7660c18d')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('16aeba2b76fccb43c5d676a1af9d0a8ac94467a08400db8cba9b9e0b17cb0fbe31adca17c09235caab56cd0284aa6e6349255379dfc6597920f7485c6080343b')
b2sums_x86_64=('e2abf95e7104f522066fdf6313d04013bcddd408c7868e1e321e88251c82bed55017e3f2a23cc3a4e703b157beba81fd9634938aea3fc564a22798f74c59b28b')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

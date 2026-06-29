# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.514.0
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
sha256sums_aarch64=('5fa2b622e6750e6276db1e25c0faa4d376d338c1094c6423493c002b9c122367')
sha256sums_x86_64=('87ded9562abc03a045db5cb9a6a9a4efe0b6bef3fe1109e692ee81cd93b0a2fb')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('0c62427fcd88fa361e2cc170d923f5be0458fae9bee6fab4db44cf4517f44c55762ea801d6e0f6ffe60ff882ee7aaad1859f18bc242f97e45ac2346b085df535')
b2sums_x86_64=('e22b972bd787ae021a842809f7841edaa8b14b59f3e8857df85a392c1f4d51e3c88bfc1df9e10b9368783d02dffc823cb08f13e6aa73bff7495c65d8bd17dd0c')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

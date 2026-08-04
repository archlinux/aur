# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.527.2
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
sha256sums_aarch64=('50839d67ee5f63d4f52e53a52fd7dd307b0e85c50977265896c1ae19d441d6dd')
sha256sums_x86_64=('46787f9c8ca77287d61315c5c252e98856efea521983e723407eba59b808729c')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('0c92f5c2fe5f3710788f628eab58c5004735464b2eea47a439885e534911c555ff5133d74f6b8222c71a0f8ea9ac7d5cee1248a0d2fcc387ce7b60a7e10a5804')
b2sums_x86_64=('d65c6ab6a3933cdd5495ee25642b1fe4b74f27e7abd29f544dcdf7b3b9a8059006fc64655faabcf5e7c6c3ed93e92d77e45132a7856711db0db6abaab5da9d43')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

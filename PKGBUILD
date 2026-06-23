# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.509.1
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
sha256sums_aarch64=('b9443a80d53a7b9ec10a68550cfd6d8ab06ebcb927cc11d36e75b957cdc261b0')
sha256sums_x86_64=('6f7b7a3d5c8c0db44738aa87004d19b2a31f6976af6451ab0d37044c74a977d8')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('38f3ded93e573df5f6258295df6f86760bb6c8189cc50c830ec394c8c8ad0231e8ca6424afa5f662e34be1c892e56a7b47863b0e3923d16330c0cc845fc0a406')
b2sums_x86_64=('fcb37c518146e5f3f94b19039325f7d6521a9aec7a6994a54bcb3bf462e5912404fb878d5b55e479dc5d62e5761ca066893437db7d4cc257d893c2e57e5ebbf7')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

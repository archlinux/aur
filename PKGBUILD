# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.546.0
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
sha256sums_aarch64=('692aa9baa832f31bafa87b3075781642c3bb8cb578e8aa3142edcd088bc4f559')
sha256sums_x86_64=('6ebd4328d9bbc0a9167f7f0df11acdafca8514584c4cb7d827551d7242a5c674')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('befa0039d62ac1f92b11d185c3fc835a50d205485a0c553dd9e8a579633a0fa3f264c20c52ce356f5dc866cb262716339b6a6f5d90928744085ad9126c63eba1')
b2sums_x86_64=('b872237af72ab85243a11b16b860c8e2e0b51816691eea5af37213bb9cfe4cf577c53ee2f24cfc3a5d5c42b6cdd5799cf1d3047de9841c08311029ec9a059ad6')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

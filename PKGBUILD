# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.510.0
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
sha256sums_aarch64=('48008851312f4fbfbca86d142918a635601383e1b9ae99c1a3c81ad66063c1ef')
sha256sums_x86_64=('e43e745cf3e7bd15a9d45bb6af9e5f2330579f3dbccae01786bfead262d4f4a8')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('4e9b78d01758a52eb801141e58b0b519390851aa4040bfe99e7e3ffe666eb93f07e9902c7cbc3153243a936220e1135d0517b06f8a9acb66755c6ba6f02f8a80')
b2sums_x86_64=('ee40fc413e391ce5fb3b79a7483dc85e88c800372c282429a5d6287da46997114927e2cd7911814d317965a8712a8471171bcf2ded37221d881835fd3e56176d')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

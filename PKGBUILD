# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.537.1
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
sha256sums_aarch64=('c9352c8b8fcb6e6604b56abc95cbdc8346dfb1c06a215d7c328d27f00be91c44')
sha256sums_x86_64=('e3a7aa6dd331ee3f7bb16bfa550166eb67d24ee0049e4cdfea0519c4f7f87756')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('6c14b1a093e6c5c93422928855c9800e14b9880be2b9f9a565883fab4d5706206dd20423879cba7391d67cb5aedca1505400e54cdf97e9f864498614ced8da25')
b2sums_x86_64=('7533ebc98cebc88680f6ad5803958f8b50100444ed8d7571754d339f2a4db0d2bfde903125256e71c2b937a605f88ae210635ccd2c8cabc4c2ee5a0cb18e1657')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

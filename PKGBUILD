# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.508.0
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
sha256sums_aarch64=('d8ef180c6c8ce48745c7d37dc96c21f0de657e6f776ce0fcd6ed6e4c862fa3ac')
sha256sums_x86_64=('082dd6de92d386276f2c14ab4c98233c8588834c098220bd27d7b3846887d206')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('8e5eacfdf102fa570f150c98202b7db0026b3608af0085dab862adbdb24e100da9602a850f786b0bda0c71b52b0a6956a89c450d5727bc8845a19f4b8c1b7bea')
b2sums_x86_64=('2d5cdb1a67ba07f183d36ef2fd47658d9d965dbc3ab380efdbe5d80c1ad6c4032d7984bb195d23c8d74913dd64b76558599d4534a74e8fb6c957affe889031ea')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

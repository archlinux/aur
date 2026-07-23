# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.525.0
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
sha256sums_aarch64=('8a5cc23df340d4be9c3e6b2a7b4f84a5fbb97fd442c7b91bde3b7e7df6d23251')
sha256sums_x86_64=('66e442f9362e9a82245f4c10e14bfc62c252da3122bddc649fac60490a015e3a')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('f761a89490c28bdcd9707e5feea076f2841a924196c732b357aea9a56be19ebc9a480c419dcfda181d1b2a0be7b40dd0a1128563fcd705fc3165bde7bc9bcf38')
b2sums_x86_64=('1324dbe664c70304da1678b3f24b4f3230547589d01f068713c678512c653d98f965330d59ebddac73e279dd345e4fcb3fdc80b49d11e3498b0ec7c206938b77')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

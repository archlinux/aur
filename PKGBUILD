# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.486.0
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
sha256sums_aarch64=('58618d008af0c1bd3a9117f2ba3be0a4dcc5887f11ac95df6e5d1a93c572c191')
sha256sums_x86_64=('f93f3d1bd275cf0b712ace4453049402fd08af33959824ead3eb0ba2c6cecd7d')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('7797d8b093b6e1aa009d2915822d5be2038afa26a457fb1ec98b5d0a5472e89c5ce7141867398111fed645287bbd297b85ab2b01a14cadd9e5b7c7e3d3b9bf9f')
b2sums_x86_64=('9aec843bbe435163b2bb4672bbae9a3a53970e1dc57b7be953ca7c27512222f31de928737626d37bf3c0f6b84cecca950b46715e4c2965c18584e27ea57b009c')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

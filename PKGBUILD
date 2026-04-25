# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.474.2
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
sha256sums_aarch64=('0cdd26f0eca860ea9c8df53ad76a576edcb971276955cdcfd46218681af03978')
sha256sums_x86_64=('1e5c3826e8b745fc0662b9c02658fc950f1edef629b569d47a955fb9761b4d8b')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('01521aaeaa68424703a060c7b10bf15043a9a265d2aea8757fef9aa7852fe70e45d9505023dec7871af2ca7fd29d028f8aaaad0a0e1cb0709c535ff95ec55e9e')
b2sums_x86_64=('c47c6d34a15e2aa11e4271c0974bd2cd12b1e3c02de66019281fae97933beaa6046cee60c14f9e47a4156a3a7b122a859407c6cc6f22e54351166a28601bbbe5')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.518.0
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
sha256sums_aarch64=('7b3024f57a9ce20e907dcc54a98ef17633fb849c11118f00faac8dc4dded6a20')
sha256sums_x86_64=('da2b39653f2b158e8627098077e1fee5d464b9530466e2736be99423fb060964')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('e2571f591a6ae3f46a7c13daaf33ac508a509e72d0ce5ae7f00317a2224d3dc8b81a4d093826a278e15080865ff71ea6056df4e0d5c567292a743fda62a9bc7a')
b2sums_x86_64=('4a3d8bb0bbbeb0c49bcf7d6c54cec217f9edd0d482fe0af61e5b68bdfb2c8885db517b784ae63de2ac2f2d960559fdf6eede45994ea789ab9df205d251ada2b2')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

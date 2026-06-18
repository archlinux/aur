# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.509.0
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
sha256sums_aarch64=('39e366dd488fb9f907ae7ac3d899b1a8dfc883c5a3e6bef0cbab2c484fc6b43a')
sha256sums_x86_64=('0407e48d969455c54c0e92f6a7c18aa2c167f21b4729f2e08e29050299e2574e')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('7ffa06f2ec8a08893ea011b5d7ecc6ba78e6c780ccc352332f7d795703611afe2ce7ebce375c1aa4d5e4131f143ce5152e384065131e39453e70db6a2a6a4ecb')
b2sums_x86_64=('d9be994a92101359bb8fa48ca38172b106269f3fd0f361f120938a6c51f09b5b291e60bfffcca477ff59bf36c6af3decfa38ff166d29354d6dd422461ce8421f')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

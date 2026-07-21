# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.524.0
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
sha256sums_aarch64=('ec2ddde6cf64dd61cb0c56b849112cffcdba7fcdae56eb560daaf4d46baff580')
sha256sums_x86_64=('595544b08b8ab037ab752989a410389b19f62bec3935529c3642bf65b324d5d4')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('86d08cf11187d84c381a5350a2fe62f0cd6b374c3ab3ca24394cdaa11aac27d93dbcdade83d19761b34dc20f7c5ba00cbe505f7a770d866e674b9d9be3845092')
b2sums_x86_64=('f9cd5fc6ecc203d595a0bf9afa6e25d21bb832bba292fe19f8aadeab60f9b4cfc963b773356ad843cd86a023ca009d09352288c2fdb1a8d12b3e846156e93ad1')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

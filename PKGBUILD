# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.493.0
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
sha256sums_aarch64=('373f477af7f90dc858c21f1c34efc2d94c56fb1e3894675b43abee93423989e1')
sha256sums_x86_64=('63c6fb2a33a1b2959d330e0a4dc934659adcdc3685243becdb4d522e94efc17d')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('2f6215d8132dbab3a2329bea93eefa89556f19ea18a8d665251132361d1eff2424ee9ca3a216f5efddfad99d0dbe52a6e0e1b14274991a280cbea19d0646f09f')
b2sums_x86_64=('9fb37ac5ecf86921fc93a1da1b9fb6519028b27d1c3d4ab58bd61ae4fd580a3377cd9912b527c4548e16dd403cfb32de31b28386e75fdba4fed1383c69256181')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

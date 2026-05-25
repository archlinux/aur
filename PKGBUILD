# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.495.1
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
sha256sums_aarch64=('37f1f3ed2ba6ad5f50091f566f82c0b44d12fb82a13750873a7dd9e5fb5e53c7')
sha256sums_x86_64=('17752c98df38a2f8a75a088067a70ddee0a1cc4083c10bd1dde305a10297a83f')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('c0e9b53bb4db10b58f0016e960dfd40727a7162b636eb1dadba643c22f0d2db55403ae190200f24cb3c895842bfef5e4c2c793c842f2f95af8ee803c871c393f')
b2sums_x86_64=('40f10d73dd34eecc1c215b15f355e34b34e2c4efbf732b8559fe5369e24c3073d0e072168d8cbd91f3b650e12559a415ca818edba61cb2bf44ba4e653f01ed8c')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}

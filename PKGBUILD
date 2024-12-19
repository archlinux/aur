# Maintainer: Semirose <AppdullahMohammed at gmail dot com>.
# edited copy of PKGBUILD from vscodium-marketplace.

pkgname=vscodium-translucent-marketplace

pkgver=1.65.0
pkgrel=1
pkgdesc='Enable vscode marketplace in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-translucent' 'sed')
provides=('vscodium-translucent-marketplace')
conflicts=('vscodium-translucent-marketplace')
install="${pkgname}.install"
source=("${pkgname}.hook"
		"${pkgname}.install"
        'patch.sh')
sha512sums=('5c2c52f97a9ae34f7dcdce455fc5c495b7e36cea6682b906147ba1f561d62e6735033af4afdc06d44600509a6f0202d11b439d6806798ae4c2fc6b64c5164835'
            '163b77249c62b043e56051578733fea31c22544838d703216a090dd4bd08b8342fddecbae3235365beb13715bde2ca9acf7e51e50b5e4d92d9a6418ab8c43345'
            '89823f2b5259c86f6e69c9b408a77d61509fded7a5592a52495ede14c71d67d318b4c4c5b4bf37e878aafe45d59cc53c4bba7a8769f3e469bb9bb0e155ad43aa')
package() {
  install -Dm 644 "${srcdir}"/"${pkgname}".hook "${pkgdir}"/usr/share/libalpm/hooks/"${pkgname}".hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium-translucent/resources/app/patch.sh
}


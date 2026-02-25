# Maintainer: Avi Tretiak <avi (at) babi (dot) uy>.
# Script and PKGBUILD based off of vscodium-all-marketplace.

pkgname=vscodium-translucent-marketplace

pkgver=2.0.0
pkgrel=1
pkgdesc='Enable vscode marketplace in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-translucent' 'python')
provides=('vscodium-translucent-marketplace')
conflicts=('vscodium-translucent-marketplace')
install="${pkgname}.install"
source=("${pkgname}.hook"
		"${pkgname}.install"
        'patch.py')
sha512sums=('8666098e51dbc40967020670d5ae48b6adb88adf8798aa32969bc56f98cb5378844db4a46a30070838fe46345bac5a49cd674caf767caa2084326f9a9e26232a'
            '8cac34d5819739685de1cfec1d2c09cdf2817e78482ed3a2f305c96ef3958b131ba021051b5d4f82292c9225768df246ff37750058688488140b695e7ca81bd3'
            'e275b4f9990cc0f8f173f94adc0cc6d667286feec096f87c05fb01e3f57ef2002d88d513416e1dd93e8227ad6092be4917751daa37ed1418e0addc15d2ba861b')
package() {
  install -Dm 644 "${srcdir}"/"${pkgname}".hook "${pkgdir}"/usr/share/libalpm/hooks/"${pkgname}".hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/vscodium-translucent/resources/app/patch.py
}


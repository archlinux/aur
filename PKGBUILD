# based on vscodium-marketplace
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Previous Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=vscodium-marketplace
pkgver=1.65.0
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium' 'sed')
install="${pkgname}.install"
source=('vscodium-marketplace.hook'
        'patch.sh')
sha512sums=('4b0101d3cdc48036bf264afe58ba1c2c2dc6852e24ed837b25f39a61f332145cf168910410ff6123f41a980c0991f31c4167ed5883ad576d046d6c421f110a0f'
            '44e8ccad463dc57376f34de5c3eb48d2f7ebf008e38ae4989c43ca2db397eeafff90485d0189c752240f1872ff96ac96f637a070e3453f38557cc56b7be6a7d0')
package() {
  install -Dm 644 "${srcdir}"/vscodium-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium/resources/app/patch.sh
}


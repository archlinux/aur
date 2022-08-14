# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Previous Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=vscodium-git-marketplace
pkgver=1.70.0
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-git' 'sed')
install="${pkgname}.install"
source=('vscodium-marketplace.hook'
        'patch.sh')
sha512sums=('4b0101d3cdc48036bf264afe58ba1c2c2dc6852e24ed837b25f39a61f332145cf168910410ff6123f41a980c0991f31c4167ed5883ad576d046d6c421f110a0f'
            '92b5f4bb8eb191d346d5f8d4a79b3a955c244af0b38864d42a6545cc251cdf7ddc6715dd4e64ee85be4125425162612675835e880b155999de512fe552f19b9f')
package() {
  install -Dm 644 "${srcdir}"/vscodium-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium-git/resources/app/patch.sh
}


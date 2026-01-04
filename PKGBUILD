# Based on vscodium-marketplace
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname=vscodium-all-marketplace
pkgver=1.0.0
pkgrel=1
pkgdesc='Enable vscode marketplace in all vscodium versions.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium' 'python')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py')
b2sums=('719ea2b74ecf13f5071d20f7db5281550d90eb577492fa66c51780c8ea8776c95edad9b0f1859cc7a299df4998e60ed22b732885718babcd2190ef8a1abb4432'
        'b38ac57590be941f35336bc9124bcf3890fec0125d93e5e963846f159f85d5e48a8473f4f3c25075892758ad220591ccd8b34b5f9ef426758872640b43ab0d14')
sha512sums=('bd9662aa0fea41fdb5cd8d7f9d9f5606379f0b25a14e97814b98326da325af1b1ae3e212ae344a7873dc6e3a2e70b13b384ae993612bebcb2293560f0df460ec'
            '31c04ed4fd61a839ec09e32adf89e32ce62135922c9b8e44e12e7adb186ed970be098f9a2ea5edbf706dd632aa9b07a8e3f4d81924697273ab812f2eb20f7202')
sha384sums=('6f0493fadbe5ac7a9434f308375b3eeb3b7380c7875e90b50615161700d56c4b8e01cba82c015905a58ee14aedecf71e'
            'ccbe5f546efd11cda850da85e436ffe14b7745d7e6dc93ad661e0475542f642839f78b1f238c8346655b4ecc48fc2964')
sha256sums=('d4b87ebc9034673aef23b38ecd7b7c69d5b53b5e7f348abe4026862deaea6bae'
            '678532bfbde06731c5803f8a10dadeef29c2618cc7c2dad0a9af1990b6af2a8a')
conflicts=(
    vscodium-marketplace
    vscodium-bin-marketplace
    vscodium-git-marketplace
    vscodium-insiders-marketplace
    vscodium-insiders-bin-marketplace
    vscodium-electron-marketplace
    vscodium-electron-bin-marketplace
)

package() {
  install -Dm 644 "${srcdir}"/${pkgname}.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/vscodium/resources/app/patch.py
}

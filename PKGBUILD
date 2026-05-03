# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Original Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Previous Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Maintainer: G'lek Tarssza <glek at glektarssza dot com>

pkgname=vscodium-insiders-marketplace
pkgver=1.106.0
pkgrel=1
pkgdesc='Enable the VSCode Marketplace in vscodium-insiders.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('python')
optdepends=(
    'vscodium-insiders: For VSCodium Insides support.'
    'codium-insiders: For alternative VSCodium Insides support.'
)
install="${pkgname}.install"
source=('vscodium-insiders-marketplace.hook'
    'patch.py')
sha512sums=('1330368d4ad7e875f943d9e8fc49c9737b659111647e418aadd9f39bfe18c541c92d02a9a6f11bc824769557e4e4b965782f66548872245132a418a08b37c3b0'
    '8d7b1d62b084356d2de85c943b9b18404748d9a6e3b495ccee2c739cc9ebb6d0d2809558545b4022eb6e34b99d146a9b2d22c264cea1fe781234f9e2a02fc842')

package() {
    install -Dm 644 "${srcdir}"/vscodium-insiders-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-insiders-marketplace.hook
    install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/vscodium-insiders/resources/app/patch.py
}

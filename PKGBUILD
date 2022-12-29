# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=otf-monocraft
pkgname=(otf-monocraft ttf-monocraft)
pkgver=2.2
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=("custom:OFL")
makedepends=("fontforge")
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bde6933d0d29f68047ace8f13a24125661213d205778b1d3862ba59bc6f6f54a')


build() {
    cd "Monocraft-$pkgver/src"

    python monocraft.py
}

package_otf-monocraft() {
    cd "Monocraft-$pkgver"

    install -Dm644 "dist/Monocraft.otf" "$pkgdir/usr/share/fonts/OTF/Monocraft.otf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-monocraft() {
    cd "Monocraft-$pkgver"

    install -Dm644 "dist/Monocraft.ttf" "$pkgdir/usr/share/fonts/TTF/Monocraft.ttf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

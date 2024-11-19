# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=catapult-bin
pkgver=24.11a
pkgrel=1
pkgdesc="A cross-platform launcher for Cataclysm: DDA and BN"
arch=("x86_64")
url="https://github.com/qrrk/Catapult"
license=("MIT")
depends=(freetype2 sdl2_image sdl2_mixer sdl2_ttf zip)
provides=("catapult")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/catapult-linux-x64-$pkgver"
        "catapult.sh"
        "catapult.desktop" 
        "catapult.svg")
sha256sums=('35551751b8c9b23b99b16b4f3fa61059c6bf58bc548ab679e2ca0e8cb6397ed8'
            'f3aec11b591edf74db91ba7e00239f2f155dd67376f4c5182cb8c77968c0d992'
            '034c9dd45dbaae5e56fb7be4470272b4aec128437c0a6ba12609a355f97aa37d'
            'e097f3147e96570e75e9e356114a42989784dfdc98388a3261517b481c850e39')

options=('!strip')

package() {
    install -dm777 "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/$pkgname-$pkgver"  "${pkgdir}/opt/${pkgname}/catapult"
    install -Dm755 "${srcdir}/catapult.sh"  "${pkgdir}/usr/bin/catapult"

    install -Dm644 "${srcdir}/catapult.svg"  "${pkgdir}/usr/share/pixmaps/catapult.svg"
    install -Dm755 "${srcdir}/catapult.desktop"  "${pkgdir}/usr/share/applications/catapult.desktop"
}

#vim: syntax=sh

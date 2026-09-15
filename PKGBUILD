# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=catapult-dabdoob
pkgver=28.5
pkgrel=1
pkgdesc="A cross-platform launcher for Cataclysm: DDA, BN and TLG"
arch=("x86_64")
url="https://github.com/Hihahahalol/Catapult_Dabdoob"
license=("MIT")
depends=(freetype2 sdl2_image sdl2_mixer sdl2_ttf zip)
provides=("catapult")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/Dabdoob-linux.x86_64"
        "catapult.sh"
        "catapult.desktop" 
        "catapult.svg")
sha256sums=('f1a84d266a38c7c60225b05c46f9ddf3367ce00da8e61148237f2b5d39ec8c3a'
            'eac3be234765e0c314ec16d88f740492205f1802f88b0698847d7fea261e3bcd'
            'ed95a68541bcfaeb22f33031e97fa249565ec3e3bce17f820b565fb5a8bc772d'
            'e097f3147e96570e75e9e356114a42989784dfdc98388a3261517b481c850e39')

options=('!strip')

package() {
    install -dm777 "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/$pkgname-$pkgver"  "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm755 "${srcdir}/catapult.sh"  "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/catapult.svg"  "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
    install -Dm755 "${srcdir}/catapult.desktop"  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

#vim: syntax=sh

# Maintainer: oxyd <oxyd76@gmail.com>

pkgname=paromtv-appimage
pkgver=1.1.3
pkgrel=1
pkgdesc='Client for free online TV - Parom.TV.'
arch=('x86_64')
url='http://www.parom.tv/en/player'
license=('custom')
depends=('fuse')
conflicts=(paromtv)
provides=(paromtv)
options=(!strip)
_appimage="Parom.TV.AppImage"

source=(
    "http://www.parom.tv/download/parom-desktop/linux/${_appimage}"
    "paromplayer.desktop"
    "paromplayer.png"
    )
noextract=("${_appimage}")

sha256sums=(
    '4c159b956eee8abdf341c69506993b30e7e227911d6c08631b31a9d0b0701298'
    '264b36fa8374402dda680b05460d3cf942fe3b9517bb4b818cf744344974364d'
    'eca411501b38ea0d2e76f3cfac5af088c29d4c4494997bb0453f9b33406b77b7'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/paromplayer
    chmod +x "${pkgdir}/usr/bin/paromplayer"

    install -Dm644 "paromplayer.desktop"                    "${pkgdir}/usr/share/applications/paromplayer.desktop"
    install -Dm644 "paromplayer.png"                        "${pkgdir}/usr/share/pixmaps/paromplayer.png"
}

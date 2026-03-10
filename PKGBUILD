# Maintainer: phil-gru <gphilipp23@gmail.com>                                     
# Contributor: elementh <hello@lucasmarino.me>
pkgname=anytype-bin
pkgver=0.54.4
pkgrel=1
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('fuse')
options=(!strip !debug)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy')
_appimage="Anytype-${pkgver}.AppImage"
source=(
    "Anytype-${pkgver}.AppImage::https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/Anytype-${pkgver}.AppImage"
    "anytype.desktop"
    "anytype.png"
    )
noextract=("${_appimage}")
sha256sums=('9c9884ebb7571bd627bb75ce99c33c4845b34677fbaa7f3d0bedd1ccba69ffc1'
            '61566fab53f51e4dbf4063305e1d9e0970f02d160e051b3a8d6900ef645999d4'
            '41dede6dc49b7fc9beebc92437f8d0257f209f149e909b570a877cc1d7463251')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/anytype
    chmod +x "${pkgdir}/usr/bin/anytype"

    install -Dm644 "anytype.desktop"                    "${pkgdir}/usr/share/applications/anytype.desktop"
    install -Dm644 "anytype.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/anytype.png"
}

# Maintainer: phil-gru <gphilipp23@gmail.com>                                     
# Contributor: elementh <hello@lucasmarino.me>
pkgname=anytype-bin
pkgver=0.51.1
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
sha256sums=('b0df3ec8a0fd35e6c5173e494d52b2138596af0fcaaff06e58daa71b1569007f'
            '853a0de7550f606535483c2460488b948d4e85f969cca4bee119f0222385fe11'
            '41dede6dc49b7fc9beebc92437f8d0257f209f149e909b570a877cc1d7463251')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/anytype
    chmod +x "${pkgdir}/usr/bin/anytype"

    install -Dm644 "anytype.desktop"                    "${pkgdir}/usr/share/applications/anytype.desktop"
    install -Dm644 "anytype.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/anytype.png"
}

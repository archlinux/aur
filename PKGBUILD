# Maintainer: phil-gru <goldencat@tutamail.com>                                     
# Contributor: elementh <hello@lucasmarino.me>
pkgname=anytype-bin
pkgver=0.55.0
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
sha256sums=('b18b02f55fba89f3ab0c4ddd3886db1822d87fb83603b6cae973aa9db2e1812c'
            'b9d1721d2229b3b1011ccc5109c8670ad1e166ee1f80795a398f2193bb0c16c6'
            '41dede6dc49b7fc9beebc92437f8d0257f209f149e909b570a877cc1d7463251')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/anytype
    chmod +x "${pkgdir}/usr/bin/anytype"

    install -Dm644 "anytype.desktop"                    "${pkgdir}/usr/share/applications/anytype.desktop"
    install -Dm644 "anytype.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/anytype.png"
}

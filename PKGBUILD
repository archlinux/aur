# Maintainer: elementh <hello@lucasmarino.me>
pkgname=anytype-bin
pkgver=0.26.1
pkgrel=1
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('fuse')
options=(!strip)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype')
_appimage="Anytype-${pkgver}.AppImage"
source=(
    "Anytype-${pkgver}.AppImage::https://at9412003.fra1.digitaloceanspaces.com/Anytype-${pkgver}.AppImage"
    "anytype.desktop"
    "anytype.png"
    )
noextract=("${_appimage}")
sha256sums=('94fcde619cdeac56b44fbeee69abef05090c9f83d411f563e123e512ba8cf432'
            '1bda1398291bed84ebee1d2c3e94b4c367925a8e2c0bd371aba8d6604e54281f'
            '48ee23a45c29cf081ccf5188c045150b7410007cd21743ce8592974ab18120c0')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/anytype
    chmod +x "${pkgdir}/usr/bin/anytype"

    install -Dm644 "anytype.desktop"                    "${pkgdir}/usr/share/applications/anytype.desktop"
    install -Dm644 "anytype.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/anytype.png"
}

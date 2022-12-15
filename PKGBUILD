# Maintainer: Clansty <i@gao4.pw>

pkgname=yesplaymusic-electron
pkgver=0.4.5
pkgrel=2
pkgdesc="A third party music application for Netease Music. Using the system electron"
arch=("any")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
depends=(
    "gtk3"
    "nss"
    "electron13"
)
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
provides=('yesplaymusic')
conflicts=('yesplaymusic')
source=(
    "YesPlayMusic-${pkgver}.pacman::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.pacman"
    yesplaymusic.desktop
    yesplaymusic
)
md5sums=('35ddd45b8173bdc774d4b1511fbff9d5'
         '292b7bd4de561f869625c55d8a60b608'
         '4e0fc58c70fa5fa4b1e581dc0fba8b9e')

package() {
    cp -r "usr" "${pkgdir}"
    rm "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
    install -d "${pkgdir}/usr/share"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "yesplaymusic.desktop"
    install -Dm644 "opt/YesPlayMusic/resources/app.asar" "${pkgdir}/usr/share/yesplaymusic/app.asar"
    install -Dm755 "yesplaymusic" "${pkgdir}/usr/bin/yesplaymusic"
}

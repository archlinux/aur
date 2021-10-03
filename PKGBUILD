# Maintainer: Clansty <i@gao4.pw>

pkgname=yesplaymusic-electron
pkgver=0.4.1
pkgrel=1
pkgdesc="A third party music application for Netease Music. Using the system electron"
arch=("any")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
depends=(
    "gtk3"
    "nss"
    "electron"
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
replaces=('yesplaymusic')
source=(
    "YesPlayMusic-${pkgver}.pacman::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.pacman"
    yesplaymusic.desktop
    yesplaymusic
)
md5sums=('1a5c742fbd67b8bd6f832bcfde1c54f5'
         'ade11d60b069c369b57b5d1e09066519'
         '426a2f7143ad4d0f5d060ba01e349518')

package() {
    cp -r "usr" "${pkgdir}"
    rm "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
    install -d "${pkgdir}/usr/share"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "yesplaymusic.desktop"
    install -Dm644 "opt/YesPlayMusic/resources/app.asar" "${pkgdir}/usr/share/yesplaymusic.asar"
    install -Dm755 "yesplaymusic" "${pkgdir}/usr/bin/yesplaymusic"
}

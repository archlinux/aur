# Maintainer: Deltara <boided420 at gmail dot com>
pkgname="techmino-client"
pkgver=0.17.13
pkgrel=1
pkgdesc="Techmino is fun!"
arch=("x86_64")
url="https://github.com/26F-Studio/Techmino"
license=("(L)GPL")
depends=(fuse xorg-xrandr)
options=(!strip)
source=("https://github.com/26F-Studio/Techmino/releases/download/v${pkgver}/techmino_Linux.deb")
sha256sums=("6620d6bec142062e2378adccdf1dd974f7addce851bbd7b88a7877105e4c36c9")

prepare() {
    cd ${srcdir}
    tar -xf data.tar.xz
}

package() {
    install -Dm755 "usr/share/pixmaps/org.26f-studio.techmino.png" "${pkgdir}/usr/share/pixmaps/org.26f-studio.techmino.png"
    install -Dm755 "usr/share/techmino/techmino.AppImage" "${pkgdir}/usr/share/techmino/techmino.AppImage"
    install -Dm644 "usr/share/applications/org.26f-studio.techmino.desktop" "${pkgdir}/usr/share/applications/org.26f-studio.techmino.desktop"
}

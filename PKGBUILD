# Maintainer: Deltara <boided420 at gmail dot com>
pkgname="techmino-client"
pkgver=0.17.14
pkgrel=1
pkgdesc="Techmino is fun!"
arch=("x86_64")
url="https://github.com/26F-Studio/Techmino"
license=("(L)GPL")
depends=(fuse xorg-xrandr)
options=(!strip)
source=("https://github.com/26F-Studio/Techmino/releases/download/v${pkgver}/techmino_Linux.deb")
sha256sums=("9a2decf5117dc84d51b04a526c7d758521fe3e4b791033d4e0aabf26d92aae69")

prepare() {
    cd ${srcdir}
    tar -xf data.tar.xz
}

package() {
    install -Dm755 "usr/share/pixmaps/org.26f-studio.techmino.png" "${pkgdir}/usr/share/pixmaps/org.26f-studio.techmino.png"
    install -Dm755 "usr/share/techmino/techmino.AppImage" "${pkgdir}/usr/share/techmino/techmino.AppImage"
    install -Dm644 "usr/share/applications/org.26f-studio.techmino.desktop" "${pkgdir}/usr/share/applications/org.26f-studio.techmino.desktop"
}

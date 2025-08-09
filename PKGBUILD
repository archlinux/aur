# Maintainer: xii69 <xii69@yahoo.com>
pkgname=phoenix-launcher
_pkgname=phoenix-launcher
pkgver=1.3.2
pkgrel=1
pkgdesc="Phoenix Launcher"
arch=('x86_64')
url="https://phoenixclient.ir"
license=('custom')
depends=('fuse2' 'xorg-xrandr')
options=(!strip !debug)
source=("https://dl.phoenixclient.ir/lnchr/Phoenix-Launcher_${pkgver}_amd64.AppImage"
        "phoenix-launcher.desktop"
        "phoenix-launcher.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # AppImage
    install -Dm755 \
        "${srcdir}/Phoenix-Launcher_${pkgver}_amd64.AppImage" \
        "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 \
        "${srcdir}/phoenix-launcher.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -Dm644 \
        "${srcdir}/phoenix-launcher.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${_pkgname}/${_pkgname}.AppImage" \
        "${pkgdir}/usr/bin/${_pkgname}"
}

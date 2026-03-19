# Maintainer: ramisotti13-eng
pkgname=basecamp-linux
pkgver=1.3.1
pkgrel=4
pkgdesc="Unofficial Linux companion app for the Mountain Everest Max keyboard"
arch=('x86_64')
url="https://github.com/ramisotti13-eng/BaseCamp-Linux"
license=('GPL3')
depends=('fuse2')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/BaseCamp-Linux-x86_64-fedora.AppImage"
        "99-mountain-everest-max.rules::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/99-mountain-everest-max.rules"
        "app_icon_256.png::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/main/resources/app_icon_256.png"
        "basecamp-linux.desktop")
sha256sums=('b2512ddd56cb43c5d1ecfe7ee72c69e6bd18334838c7c6415145e7174ea8ccb1'
            'SKIP'
            'SKIP'
            'SKIP')
options=(!strip)

package() {
    # Install AppImage
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/basecamp-linux"

    # Install udev rule
    install -Dm644 "99-mountain-everest-max.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-mountain-everest-max.rules"

    # Install icon
    install -Dm644 "app_icon_256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/basecamp-linux.png"

    # Install desktop entry
    install -Dm644 "basecamp-linux.desktop" \
        "${pkgdir}/usr/share/applications/basecamp-linux.desktop"
}

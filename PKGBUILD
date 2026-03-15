# Maintainer: ramisotti13-eng
pkgname=basecamp-linux
pkgver=1.2.0
pkgrel=1
pkgdesc="Unofficial Linux companion app for the Mountain Everest Max keyboard"
arch=('x86_64')
url="https://github.com/ramisotti13-eng/BaseCamp-Linux"
license=('GPL3')
depends=('fuse2')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/BaseCamp-Linux-x86_64-fedora.AppImage"
        "99-mountain-everest-max.rules::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/99-mountain-everest-max.rules")
sha256sums=('f9f783c8dadd42f353a786416f59ea72fcedfbc12104c047703d37a2afd047cb'
            'SKIP')
options=(!strip)

package() {
    # Install AppImage
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/basecamp-linux"

    # Install udev rule
    install -Dm644 "99-mountain-everest-max.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-mountain-everest-max.rules"
}

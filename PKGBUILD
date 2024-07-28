# Maintainer : Jenrikku (JkKU)
pkgname="openutau"
pkgver=0.1.529
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-linux-x64.tar.gz"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/build%2F${pkgver}/${_appimage}"
               "${pkgname}.desktop"
               "${pkgname}.svg")
#noextract=("${_appimage}")
b2sums_x86_64=('287463dc16152f58b6f5e218dbd0f7ff96619fde3111757663b6d7a34147623c7bfcad38dd73b4eeb23db3ce4cfb0ece27915bdb3b8f25bd52fae3a09e9d5425')
options+=('!strip')

package() {
    # AppImage
    mkdir -p "${pkgdir}/opt/"
    cp -rv "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # Desktop file
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Icon
    install -Dm644 ${pkgname}.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.desktop"
}

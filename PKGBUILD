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
b2sums_x86_64=('287463dc16152f58b6f5e218dbd0f7ff96619fde3111757663b6d7a34147623c7bfcad38dd73b4eeb23db3ce4cfb0ece27915bdb3b8f25bd52fae3a09e9d5425'
               'c0428a24dfcd4354e5b993a8301683b23006fbd71ae039f820276e341b69af2151d0e134606dc21240c31fa21807029383e798fa9dfc17138608dba60e7ccfac'
               'ca36996bbbcf8045c103fca717843f3c5585ebd5fe1c031a01c29a5edd5291bfe0c7206fa3c3b6c277b6832e7c35b4bee8af9768766116d981e9506d83c23166')
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

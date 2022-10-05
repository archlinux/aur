# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname="openutau"
pkgver=0.0.965
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-linux-x64.tar.gz"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/build/${pkgver}/${_appimage}")
#noextract=("${_appimage}")
sha256sums_x86_64=('c80f1233767d651b8aadf0cf242b6de326ed1bacac8e7d3130b09dbdfb34a9b4')
options+=('!strip')

package() {
    # AppImage
    mkdir -p "${pkgdir}/opt/"
    cp -rv "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # Desktop file
    install -Dm644 "${srcdir}/../${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

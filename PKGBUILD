# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname="openutau"
pkgver=0.0.786
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-linux-x64.tar.gz"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/OpenUtau-Latest/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('71d06e1623d3d50dc08607cfd34761921512a7b008d08c940fb264a340b6c3df')
options+=('!strip')

package() {
    # AppImage
    mkdir -p "${pkgdir}/opt/"
    cp -rv "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # Desktop file
    install -Dm644 "${srcdir}/../${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname="openutau"
pkgver=0.0.906
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-linux-x64.tar.gz"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/OpenUtau-Latest/${_appimage}")
#noextract=("${_appimage}")
sha256sums_x86_64=('62a91e08394fc26babb8ad84551990cf929e9f4b17b9fb2c1d8412c3ee816d35')
options+=('!strip')

package() {
    # AppImage
    mkdir -p "${pkgdir}/opt/"
    cp -rv "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # Desktop file
    install -Dm644 "${srcdir}/../${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

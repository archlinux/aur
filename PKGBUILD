# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname="openutau"
pkgver=0.1.52
pkgrel=2
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-linux-x64.tar.gz"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/build/${pkgver}/${_appimage}")
#noextract=("${_appimage}")
sha256sums_x86_64=('0a7b654148364802247673b628c4b66af70d041d80504a77b36e79d6d5e0248e')
options+=('!strip')

package() {
    # AppImage
    mkdir -p "${pkgdir}/opt/"
    cp -rv "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # Desktop file
    install -Dm644 "${srcdir}/../${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

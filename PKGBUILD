# Maintainer: taotieren <admin@taotieren.com>
_pkgname=Wine_Appimage
pkgname=wine-appimage
pkgver=3.0
pkgrel=1
pkgdesc="Appimage For Wine."
arch=('x86_64')
url="https://github.com/Hackerl/Wine_Appimage"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} 'wine' 'wine-staging')
#replaces=(${pkgname})
depends=()
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}.AppImage::https://github.com/Hackerl/${_pkgname}/releases/download/v${pkgver}/Wine-${arch}-arch.latest.AppImage")
sha256sums=('0db0112ce9f639df7ea739aa735fec1cf3c695d7b623b2120e70a69583ce603e')

package() {
    install -Dm755 "${srcdir}/${pkgname}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/wine"
}

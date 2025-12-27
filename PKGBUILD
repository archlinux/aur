# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=thextech-assetpack-smbx13
_packname=smbx13
pkgver=v1.3.7.2
pkgrel=1
pkgdesc="SMBX 1.3 game assets for TheXTech"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('custom')
depends=('thextech')
makedepends=('p7zip')
provides=('thextech-assetpack')
conflicts=('thextech-supermariobrosx')
source=("assets.7z::https://github.com/TheXTech/TheXTech/releases/download/${pkgver}/thextech-${_packname}-assets-full-${pkgver}.7z")
noextract=("assets.7z")
sha256sums=("aac5e5f30338e34bc7d20104552a80e6dd05c7bd669a097e2207c23f7382a11c")
options=('!strip')

package() {
    mkdir -p "${pkgdir}/usr/share/games/TheXTech/${_packname}"
    7z x "assets.7z" -o"${pkgdir}/usr/share/games/TheXTech/${_packname}"
    mkdir -p "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/"*"."{odt,pdf} "${pkgdir}/usr/share/doc/${pkgname}/"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

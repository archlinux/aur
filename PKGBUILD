# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=thextech-assetpack-smbx13
_packname=smbx13
pkgver=v1.3.7.beta
pkgrel=1
pkgdesc="SMBX 1.3 game assets for TheXTech"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('custom')
depends=('thextech')
makedepends=('p7zip')
provides=('thextech-assetpack')
conflicts=('thextech-supermariobrosx')
source=("assets.7z::https://github.com/TheXTech/TheXTech/releases/download/v1.3.7-beta/thextech-${_packname}-assets-full-v1.3.7-beta.7z")
noextract=("assets.7z")
sha256sums=("a1123994041f56e337f059bc27ff67b7df4c961861d5a27326234ca711bb6f4b")
options=('!strip')

package() {
    mkdir -p "${pkgdir}/usr/share/games/TheXTech/${_packname}"
    7z x "assets.7z" -o"${pkgdir}/usr/share/games/TheXTech/${_packname}"
    mkdir -p "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/"*"."{odt,pdf} "${pkgdir}/usr/share/doc/${pkgname}/"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

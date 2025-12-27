# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=thextech-assetpack-aod
_packname=adventure-of-demo
pkgver=v1.3.7.2
pkgrel=1
pkgdesc="Adventures of Demo game assets for TheXTech"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('custom')
depends=('thextech')
makedepends=('p7zip')
provides=('thextech-assetpack')
conflicts=('thextech-supermariobrosx')
source=("assets.7z::https://github.com/TheXTech/TheXTech/releases/download/${pkgver}/thextech-${_packname}-assets-full-${pkgver}.7z")
noextract=("assets.7z")
sha256sums=("6b39276a7763309ac4ccc95d379bbb00fcc23373c4a5722248e1d40fe8b8d0e0")
options=('!strip')

package() {
    mkdir -p "${pkgdir}/usr/share/games/TheXTech/${_packname}"
    7z x "assets.7z" -o"${pkgdir}/usr/share/games/TheXTech/${_packname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    # mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/"*"."{odt,pdf} "${pkgdir}/usr/share/doc/${pkgname}/"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/License"*".txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

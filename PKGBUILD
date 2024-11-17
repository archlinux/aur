# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
pkgname=thextech-assetpack-aod
_packname=adventure-of-demo
pkgver=v1.3.7.beta
pkgrel=1
pkgdesc="Adventures of Demo game assets for TheXTech"
arch=('any')
url="https://github.com/Wohlstand/TheXTech"
license=('custom')
depends=('thextech')
makedepends=('p7zip')
provides=('thextech-assetpack')
conflicts=('thextech-supermariobrosx')
source=("assets.7z::https://github.com/TheXTech/TheXTech/releases/download/v1.3.7-beta/thextech-${_packname}-assets-full-v1.3.7-beta.7z")
noextract=("assets.7z")
sha256sums=("6484e481a929ec5764b250ab8a053f1b5d0f938fdcd5fd0a9986b7671b31af42")
options=('!strip')

package() {
    mkdir -p "${pkgdir}/usr/share/games/TheXTech/${_packname}"
    7z x "assets.7z" -o"${pkgdir}/usr/share/games/TheXTech/${_packname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    # mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/"*"."{odt,pdf} "${pkgdir}/usr/share/doc/${pkgname}/"
    mv "${pkgdir}/usr/share/games/TheXTech/${_packname}/License"*".txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

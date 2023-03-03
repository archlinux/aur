# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chord-bin
_pkgname=chord
pkgver=0.2.40
pkgrel=2
pkgdesc="Chord - A Modern Music Player"
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
conflicts=(chord-appimage)
depends=('nodejs-lts-fermium' 'alsa-lib' 'at-spi2-core' 'gtk3' 'nss')
options=()
source=(
  "${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman"
)
sha512sums=('d2dd6d1f3352f15c59178002ab5112fc37f2aca914f9205c7c06497e2423783a6129959329803496a6694ff50b07929218fba6e4582a497600b548c2b06fe652')
package() {
    sed 's/Categories=Music/Categories=AudioVideo/g' -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    cp --parents -a {opt,usr} "${pkgdir}"
}

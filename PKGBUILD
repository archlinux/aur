# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boostchanger-bin
_pkgname=boostchanger
pkgver=5.0.1
pkgrel=1
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('any')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
providers="nbebaw"
conflits=(boostchanger-git boostchanger-py boostchanger-appimage)
depends=(at-spi2-core alsa-lib gtk3 nss)
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('13ae9c1db6bf03c37bae123a19fbe32b7dcf2e601f20fe3d1a537d26c46fdc5f')
package() {
    bsdtar -xvf "${_pkgname}-${pkgver}.pacman" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/scalable" 
    find "${pkgdir}" -name ".*" -exec rm -r {} \;
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boostchanger-bin
_pkgname=boostchanger
pkgver=5.0.2
pkgrel=1
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
providers="nbebaw"
conflits=(boostchanger-git boostchanger-py boostchanger-appimage)
depends=(at-spi2-core alsa-lib gtk3 nss glibc cairo hicolor-icon-theme mesa libxrandr libxcomposite libx11 \
        libxfixes pango nspr libxdamage libdrm libcups expat libxcb dbus gcc-libs glib2 libxext libxkbcommon)
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('f35cd372a2fdfd941cc4e579aacc686ae9fe68cf59cf796dfc7219ad283b1859')
package() {
    bsdtar -xvf "${_pkgname}-${pkgver}.pacman" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/scalable" 
    find "${pkgdir}" -name ".*" -exec rm -r {} \;
}
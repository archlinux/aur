# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lunarcalendar-bin"
_appname="LunarCalendar"
pkgver=0.2.4
pkgrel=1
pkgdesc="Chinese Lunar Date Control Written in Qt.用Qt写的中国农历日期控件"
arch=("x86_64")
url="https://github.com/KangLin/LunarCalendar"
license=('GPL3')
depends=('glibc' 'qt6-base' 'gcc-libs' 'qt6-scxml' 'openssl' 'sh' 'qt6-webengine')
provides=("KangLin")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('bf0bf1d076f0bc4612cc412c3cdc2904e40f2a9e49b7593c5a4940efc46fc302')
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${_appname}/share/applications/org.Rabbit.${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/share/pixmaps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/"
    rm -rf "${pkgdir}/opt/${_appname}/share/man"
}
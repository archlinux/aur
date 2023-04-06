# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lunarcalendar-bin"
_appname="LunarCalendar"
pkgver=0.2.3
pkgrel=1
pkgdesc="Chinese Lunar Date Control Written in Qt.用Qt写的中国农历日期控件"
arch=("x86_64")
url="https://github.com/KangLin/LunarCalendar"
license=('GPL3')
depends=('glibc' 'qt5-base' 'gcc-libs')
provides=("KangLin")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_Ubuntu-20.04.deb")
sha256sums=('b9058c34d7a7726515f5fcb96fca61da108e4d56f6f213eb56fef54cab421563')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${_appname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/share/pixmaps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r "${pkgdir}/opt/${_appname}/lib/"* "${pkgdir}/usr/lib/"
}
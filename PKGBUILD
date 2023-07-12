# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="lunarcalendar-bin"
_appname="LunarCalendar"
pkgver=0.2.7
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
sha256sums=('747e060267deaaf907303908c0982684723e397a95db6337e125969461eea296')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${_appname}/share/applications/org.Rabbit.${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/share/pixmaps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/"
    rm -rf "${pkgdir}/opt/${_appname}/share/man"
}
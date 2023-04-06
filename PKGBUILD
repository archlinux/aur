# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calendar-bin"
_appname="Calendar"
pkgver=1.0.7
pkgrel=1
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
depends=('glibc' 'qt5-base' 'gcc-libs' 'qt5-webengine' 'qt5-multimedia' 'openssl-1.1')
provides=("KangLin")
conflicts=("${pkgname%-bin}" )
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_Ubuntu-20.04.deb")
sha256sums=('cd74d2e363be5fa6fa211d1140db075ebb7a9371f6014b6271d2b83858855801')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
    install -Dm755 -d "${pkgdir}/usr/lib/"
    cp -r "${pkgdir}/opt/${_appname}/lib/x86_64-linux-gnu/"* "${pkgdir}/usr/lib/"
}
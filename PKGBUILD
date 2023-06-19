# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calendar-bin"
_appname="Calendar"
pkgver=1.0.8
pkgrel=1
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
depends=('qt6-scxml' 'openssl' 'bash' 'qt6-base' 'glibc' 'gcc-libs' 'qt6-webengine' 'qt6-multimedia')
conflicts=("${pkgname%-bin}" )
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v1.0.8/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb")
sha256sums=('78d20b9455a4b0bb3e8825892a803486d2c58f5807e17376709100d20163287d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
}
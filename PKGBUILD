# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calendar-bin
_appname=Calendar
pkgver=1.0.12
pkgrel=1
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
depends=('qt6-scxml' 'openssl' 'bash' 'qt6-base' 'glibc' 'gcc-libs' 'qt6-webengine' 'qt6-multimedia')
conflicts=("${pkgname%-bin}" )
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb")
sha256sums=('a12313b5f346d1de4c596b796081a8ef71f84ebc7207eb0caa943842bbc21d27')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
}
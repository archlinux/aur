# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calendar-bin"
_appname="Calendar"
pkgver=1.0.10
pkgrel=1
pkgdesc="Task, calendar, Vision protection."
arch=("x86_64")
url="https://github.com/KangLin/Calendar"
license=('GPL3')
depends=('qt6-scxml' 'openssl' 'bash' 'qt6-base' 'glibc' 'gcc-libs' 'qt6-webengine' 'qt6-multimedia')
conflicts=("${pkgname%-bin}" )
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu_amd64.deb")
sha256sums=('2cdea9e833c0b4f0085ea3dd3bb1f215a89e6586a9b6c5b30273bb8713b0f147')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
}
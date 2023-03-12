# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='photosir-himirage-bin'
_pkgname="cn.photosir.himirage"
pkgver=2.5.1.30303
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=('x86_64')
license=('unknown')
url="https://photosir.com"
provides=(photosir)
depends=(qt5-svg qt5-multimedia qt5-wayland qt5-webengine at-spi2-core qt5-websockets gtk3 qt5-xmlpatterns unixodbc qt5-sensors)
optdepends=()
source=("${_pkgname}-${pkgver}.deb::https://cdn.photosir.cn/package/uos/${_pkgname}.amd.deb")
sha256sums=('e40acc218e5ca68910f383356ec79f3818a6898fc7b2594d37d44676c779416d')
package(){
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${_pkgname}/info"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cp -r "${pkgdir}/opt/apps/${_pkgname}/entries/icons" "${pkgdir}/usr/share/"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_appname=SerialPortAssistant
pkgver=0.5.15
pkgrel=1
pkgdesc="A cross-platform serial port assistant. It can run on WINDOWS, linux、android、macos system.一个跨平台的串口助手"
arch=("x86_64")
url="https://github.com/KangLin/SerialPortAssistant"
license=('GPL3')
depends=('glibc' 'qt5-base' 'gcc-libs' 'qt5-serialport')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('29fda5f4dee0219db510914f746081c141f2f7171fd5c263d24999acc6e36c0d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
}
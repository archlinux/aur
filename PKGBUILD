# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="serialportassistant-bin"
_appname="SerialPortAssistant"
pkgver=0.5.13
pkgrel=2
pkgdesc="A cross-platform serial port assistant. It can run on WINDOWS, linux、android、macos system.一个跨平台的串口助手"
arch=("x86_64")
url="https://github.com/KangLin/SerialPortAssistant"
license=('GPL3')
depends=('glibc' 'qt5-base' 'gcc-libs' 'qt5-serialport')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu-20.04_amd64.deb")
sha256sums=('fde29fed42b2ebf0202e9eba2cbecb988f33fe304e1e9f757bee2c011d62ce22')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    cp -r "${pkgdir}/opt/${_appname}/share/"* "${pkgdir}/usr/share/"
}
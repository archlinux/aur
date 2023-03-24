# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=apifox
pkgname="${_pkgname}-bin"
pkgver=2.2.29
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('unknow')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(gtk3 lib32-gcc-libs nodejs-lts-fermium nss at-spi2-core java-runtime alsa-lib libxdamage expat cairo libx11 dbus \
  nspr libxrandr lib32-glibc libxext gcc-libs libxcomposite libxcb gdk-pixbuf2 glib2 libcups libxshmfence libdrm mesa glibc \
  libxfixes libxkbcommon hicolor-icon-theme pango)
options=()
source=(
  "${_pkgname}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
)
sha256sums=('4c444436ba47abd5cb769c447ce941bfdeedca32bb806b9bffd768b27ac4ce9c')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/oas-validator/node_modules/ajv/scripts/info"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=apifox
pkgname="${_pkgname}-bin"
pkgver=2.2.32
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('custom')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(gtk3 lib32-gcc-libs nodejs nss at-spi2-core java-runtime alsa-lib libxdamage expat cairo libx11 dbus \
  nspr libxrandr lib32-glibc libxext gcc-libs libxcomposite libxcb glib2 libcups libdrm glibc libxkbcommon \
  libxfixes hicolor-icon-theme pango mesa sh)
options=(!strip)
source=(
  "${_pkgname}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
)
sha256sums=('a886aed8894151367bf13e1f974a23abc29ee5badbb649bbd8409e20ba9e7673')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/oas-validator/node_modules/ajv/scripts/info"
}
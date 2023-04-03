# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=apifox
pkgname="${_pkgname}-bin"
pkgver=2.2.30
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('custom')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(gtk3 lib32-gcc-libs nodejs nss at-spi2-core java-runtime alsa-lib libxdamage expat cairo libx11 dbus \
  nspr libxrandr lib32-glibc libxext gcc-libs libxcomposite libxcb gdk-pixbuf2 glib2 libcups libxshmfence libdrm \
  libxfixes libxkbcommon hicolor-icon-theme pango mesa glibc sh)
options=()
source=(
  "${_pkgname}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
)
sha256sums=('4510a803f2d0e846bf8206d92f391177116895250e215a7c0a2b9d19cf101947')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/oas-validator/node_modules/ajv/scripts/info"
}
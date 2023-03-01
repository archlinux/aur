# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=apifox
pkgver=2.2.24
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://www.apifox.cn/"
license=('unknow')
conflicts=(apifox)
providers=(apifox)
depends=(gtk3 lib32-gcc-libs nodejs-lts-fermium nss at-spi2-core java-runtime alsa-lib)
options=()
source=(
  "${_pkgname}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
)
sha512sums=('a8571519c968ee15bf17ca8da9f8dc5c305c02e2e5d076f18e2b7b8b23efc77553ab67414556fe80665dde2cbd9175e0fcd191fac9e34e9428927514d8d5863f')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info"
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=apifox
pkgver=2.2.26
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
sha512sums=('7b6b1614d043698b46138e2391d16e958844d71b8954a6ca47b2cf634193a248a3eed4ef6678e0dbbf8ba1b3b8e52902ac5fbdbd9c46de9b0858835d73866e3b')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info"
}

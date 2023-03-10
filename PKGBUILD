# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=apifox
pkgver=2.2.27
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
sha512sums=('bc8bd275d5cefc54978540dd72ab382de20b34cd511f3c0943f85507886b4d91ac91fc43becf0b21fa3a62eef7599181987db0adaf7f4d6595b8d046c01c9bee')
   
package() {
    ar -x "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info"
}

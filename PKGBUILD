# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apifox-bin"
pkgver=2.3.8
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('aarch64' 'x86_64')
url="https://apifox.com/"
_githuburl="https://github.com/apifox/apifox"
license=('custom')
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('gtk3' 'lib32-gcc-libs' 'nodejs' 'nss' 'at-spi2-core' 'java-runtime' 'alsa-lib' 'libxdamage' 'expat' 'cairo' 'libx11' 'dbus' \
  'nspr' 'libxrandr' 'lib32-glibc' 'libxext' 'gcc-libs' 'libxcomposite' 'libxcb' 'glib2' 'libcups' 'libdrm' 'glibc' 'libxkbcommon' \
  'libxfixes' 'hicolor-icon-theme' 'pango' 'mesa' 'sh')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://cdn.apifox.cn/download/Apifox-linux-arm64-deb-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip")
source=("LICENSE.html")
sha256sums=('3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19')
sha256sums_aarch64=('330106c19f76b56ef76139c7d36dd4fe7a0c7a416c6c6ca517bb666c2cad570d')
sha256sums_x86_64=('c8272a08345546b3bcfcc49ff6452cae00ac25bb4d1bee4332c13f8d971477d6')
    
package() {
    bsdtar -xf "${pkgname%-bin}_${pkgver}_"*.deb
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
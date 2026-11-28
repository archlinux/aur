# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=brain0-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Black box recorder for AI-written code"
arch=('x86_64' 'aarch64')
url="https://github.com/Brain0-ai/brain0"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Brain0-ai/brain0/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/brain0-cli-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/brain0-cli-linux-arm64-${pkgver}.tgz")
sha256sums=('c85fb09b3dc75305abeea468ced98ec287889024900223bb162831a9d3f07de1')
sha256sums_x86_64=('b7cd3857148acaf6d77cf87bc05e6fc9d0e30f7da0b065b411800c2fca8e4220')
sha256sums_aarch64=('d412fa05bd3fb7308378dab9955ff5f83927ed4564f9752fd43ad72f77625cea')

package() {
  install -Dm755 "package/brain0" "${pkgdir}/usr/bin/brain0"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

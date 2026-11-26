# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openapi-mock-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="OpenAPI mock server with random data generation"
arch=('x86_64')
url="https://github.com/muonsoft/openapi-mock"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/muonsoft/openapi-mock/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openapi-mock-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('4d935aad318eb257a6f26b4d618a2d4512089eedcb489d42ddc1bc1071681ff9')
sha256sums_x86_64=('2b9505061697eb72c74aba25eaab44ab18f0377d599ecb8f48c21e318b2c24f4')

package() {
  install -Dm755 "openapi-mock" "${pkgdir}/usr/bin/openapi-mock"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

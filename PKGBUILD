# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openapi-changes-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="OpenAPI breaking changes detector"
arch=('x86_64' 'aarch64')
url="https://github.com/pb33f/openapi-changes"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openapi-changes_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openapi-changes_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9316c7fbb9bd62ee794ffe07ae97aee43ea4f483226bbb4cf9d07f658439883a')
sha256sums_aarch64=('0ed4b378beecd3f49e5dbdc49cb2ed2503e98aa95eb9b4ecf921173fa7fcb775')

package() {
  install -Dm755 "openapi-changes" "${pkgdir}/usr/bin/openapi-changes"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=apple-health-ingester-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="HTTP server that ingests Apple Health data into files, InfluxDB and more"
arch=('x86_64' 'aarch64')
url="https://github.com/irvinlim/apple-health-ingester"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/irvinlim/apple-health-ingester/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/apple-health-ingester-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/apple-health-ingester-linux-arm64")
sha256sums=('88c0332487991ac9bac3392ba6778efb8cbd703f24cf73004c59206f13318e4e')
sha256sums_x86_64=('ec148252f27af842764d4f07536c6e9058c103036d5970cd75e0d9cb8dc8e8ed')
sha256sums_aarch64=('a31856ab40ba5be48b76261d4bb01045961684c430cc2be00278dcbcdf25ee60')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/apple-health-ingester"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

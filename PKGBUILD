# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=druid-exporter-bin
pkgver=0.11
pkgrel=1
pkgdesc="Prometheus exporter for Apache Druid"
arch=('x86_64')
url="https://github.com/opstree/druid-exporter"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/opstree/druid-exporter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/druid-exporter-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7ad26e9c93aec78f23ed8006cf29e307d3003cbac42456054636e1827cdd5109')
sha256sums_x86_64=('c41589d0a7e17018f1fe85dfc2e7f296beeec4515e0a18f332543c043ece1146')

package() {
  install -Dm755 "druid-exporter" "${pkgdir}/usr/bin/druid-exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

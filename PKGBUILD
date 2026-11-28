# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mongodb-query-exporter-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Prometheus exporter for MongoDB aggregation queries"
arch=('x86_64' 'aarch64')
url="https://github.com/raffis/mongodb-query-exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mongodb-query-exporter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mongodb-query-exporter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bf4358d38e67e51e7130da0180cfe72ca55aee74b721b650b93152f39edef962')
sha256sums_aarch64=('a408f8a1706c1ab286eb7197399336dd55fb6bcfb2827d71180b931f8a922228')

package() {
  install -Dm755 "mongodb-query-exporter" "${pkgdir}/usr/bin/mongodb-query-exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

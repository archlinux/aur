# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=helm-exporter-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Export Helm stats in Prometheus format"
arch=('x86_64')
url="https://github.com/sstarcher/helm-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/helm-exporter_Linux_x86_64.tar.gz")
sha256sums_x86_64=('5f15f3d9533143f6e9c28cd5cc04893bda2a3c5107912c349cbecdac112c38d8')

package() {
  install -Dm755 "helm-exporter" "${pkgdir}/usr/bin/helm-exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

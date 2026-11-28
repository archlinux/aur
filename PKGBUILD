# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=atlas_exporter-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Prometheus exporter for RIPE Atlas measurement results"
arch=('x86_64' 'aarch64')
url="https://github.com/czerwonk/atlas_exporter"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/atlas_exporter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/atlas_exporter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5007f14e41eddd5c8ba74a91fd194ddd9c966016dadee1645e9a6495e2c7dd30')
sha256sums_aarch64=('d4b4d2aa5e510c585796b9f18a0a12bc622ab61fc48e9cd3636a4791ef4daebb')

package() {
  install -Dm755 "atlas_exporter" "${pkgdir}/usr/bin/atlas_exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=network_exporter-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Prometheus exporter for ICMP, MTR, TCP port and HTTP checks"
arch=('x86_64' 'aarch64')
url="https://github.com/syepes/network_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/network_exporter_${pkgver}.Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/network_exporter_${pkgver}.Linux_arm64.tar.gz")
sha256sums_x86_64=('b1b39fdc9fc474369cd3a3d95a1bc268f5c4da6e3c003f7505bbcae24eaac87c')
sha256sums_aarch64=('b50c2ccd144445dea5b9da6b6de270e01422c383fb59f1c6e91a2aff6838f9d0')

package() {
  install -Dm755 "network_exporter" "${pkgdir}/usr/bin/network_exporter"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

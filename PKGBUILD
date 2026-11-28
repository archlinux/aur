# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slo-exporter-bin
pkgver=6.16.0
pkgrel=1
pkgdesc="Compute standardized SLI and SLO metrics from events"
arch=('x86_64' 'aarch64')
url="https://github.com/seznam/slo-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slo-exporter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/slo-exporter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9300522b4ef5e7d24e782230c79f281bcc24e04746c0c420e91ec20da4434add')
sha256sums_aarch64=('4febf172ad761503538ba0e8ec4bd381bb7b62738c0a783b6106c2f829216819')

package() {
  install -Dm755 "slo_exporter" "${pkgdir}/usr/bin/slo_exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

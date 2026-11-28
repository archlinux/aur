# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dellhw_exporter-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Prometheus exporter for Dell hardware using OMSA"
arch=('x86_64')
url="https://github.com/galexrt/dellhw_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dellhw_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums_x86_64=('68616a3acd7f3a648a061b6e11783d48fde1de277d8854d9ed030c0d42bb5e8b')

package() {
  install -Dm755 "dellhw_exporter-${pkgver}.linux-amd64/dellhw_exporter" "${pkgdir}/usr/bin/dellhw_exporter"
  install -Dm644 "dellhw_exporter-${pkgver}.linux-amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

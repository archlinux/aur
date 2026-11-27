# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=logchef-bin
pkgver=2.8.3
pkgrel=1
pkgdesc="Self-hosted log analytics for ClickHouse, VictoriaLogs and Grafana Loki"
arch=('x86_64' 'aarch64')
url="https://github.com/mr-karan/logchef"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/logchef_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/logchef_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('07f7cd3624d221c2a650d825d44c34dfb46be26ed44008ada661f9f8380b00bc')
sha256sums_aarch64=('bd0895c4609b0242402e3a517e1051d50e3b57f250afdfcbcc26dd4c25a47ded')

package() {
  install -Dm755 "logchef" "${pkgdir}/usr/bin/logchef"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

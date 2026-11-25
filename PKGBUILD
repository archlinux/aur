# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=logchef-bin
pkgver=2.8.2
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
sha256sums_x86_64=('0054ab129527a546cf1dae7711be0b3357fd1a4aff382b887f909ba1885edfdc')
sha256sums_aarch64=('8ac6ab4bc8a7446b63529e6b6ca57bf5397f5eb879024b924f983af8bb7ca5cb')

package() {
  install -Dm755 "logchef" "${pkgdir}/usr/bin/logchef"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

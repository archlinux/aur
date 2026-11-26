# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bigquery-emulator-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="BigQuery emulator server"
arch=('x86_64' 'aarch64')
url="https://github.com/goccy/bigquery-emulator"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bigquery-emulator_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bigquery-emulator_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8dbe6d3ebe3e8963523bada4a88a012d6a1bbc2ea779fbdc2e31d2e8c8c51c36')
sha256sums_aarch64=('4c6913619c90b4a8a9378993e797774390289f9c94deba483d2a6db9cefbc8c5')

package() {
  install -Dm755 "bigquery-emulator" "${pkgdir}/usr/bin/bigquery-emulator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

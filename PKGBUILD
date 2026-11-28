# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ogcode-bin
pkgver=0.60.0
pkgrel=1
pkgdesc="Local-first AI teammate and agent environment"
arch=('x86_64' 'aarch64')
url="https://github.com/prasenjeet-symon/ogcode"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ogcode_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ogcode_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6aac25ffd489863e0545f6889c10c56b6d07d019af4333e29b36edb9f540ad41')
sha256sums_aarch64=('9c3dfe95ab5ebb6dea4db2b4b2d7288570f3fb9d4ce8d9688995fa13f707417c')

package() {
  install -Dm755 "ogcode" "${pkgdir}/usr/bin/ogcode"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

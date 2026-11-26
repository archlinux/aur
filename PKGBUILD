# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=machinist-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Software factory infrastructure for AI coding workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/owainlewis/machinist"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/machinist_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/machinist_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6e38d8f6e9f8e68f88b85a057c1c01c71111ed625415fb369629f7a246ed9bf1')
sha256sums_aarch64=('3fbfae118f51269683b8b3b6ebc1a9727640f6168b1d9b567fd47cfd15973336')

package() {
  install -Dm755 "machinist" "${pkgdir}/usr/bin/machinist"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

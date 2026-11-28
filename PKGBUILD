# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sietch-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Decentralized, resilient storage for digital nomads"
arch=('x86_64' 'aarch64')
url="https://github.com/S4tvara/Sietch"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sietch_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sietch_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('4d8c0c33ed0d3fc6715a11384a6f8859b513573350b4216a5ff783206d04add5')
sha256sums_aarch64=('4de96f9dd25d7e47fe9f8669d7fa79d1445e1741133c5c9701233380df7a4d0f')

package() {
  install -Dm755 "sietch" "${pkgdir}/usr/bin/sietch"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

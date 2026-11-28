# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=scrutineer-bin
pkgver=2026.11.21.1
pkgrel=1
pkgdesc="Security review tool for software projects"
arch=('x86_64' 'aarch64')
url="https://github.com/alpha-omega-security/scrutineer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/scrutineer-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/scrutineer-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('5b6ea3b1c70e655ed04f18b4a3a37ae11d08ac25781ef30030c996d902652c1f')
sha256sums_aarch64=('987d81b24847d640b7e6fb933e1db279055a6a066ee9d35cfec777422028c26d')

package() {
  install -Dm755 "./scrutineer" "${pkgdir}/usr/bin/scrutineer"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

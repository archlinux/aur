# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openlore-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A minimal, extensible, agent-native knowledge repository that keeps shared context current and inspectable"
arch=('x86_64' 'aarch64')
url="https://github.com/aakarim/OpenLore"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openlore_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openlore_linux_arm64.tar.gz")
sha256sums_x86_64=('f769c7539c2168af3e94ae52db8089b561f8ce8c5e81f3ae9b6dac79bda0e7fa')
sha256sums_aarch64=('d0a64f7812d598820b4aa1e2eba141ffcc390452731b9f954a24ecc41c078080')

package() {
  install -Dm755 "openlore" "${pkgdir}/usr/bin/openlore"
  install -Dm755 "lore" "${pkgdir}/usr/bin/lore"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zaparoo-core-bin
pkgver=2.24.0
pkgrel=1
pkgdesc="Core service for Zaparoo"
arch=('x86_64' 'aarch64')
url="https://github.com/ZaparooProject/zaparoo-core"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zaparoo-linux_amd64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zaparoo-linux_arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('79e0fd7a2eb39472df044d070919d5f2db5240ce7ed03cbfc7e1fc3fa53839c5')
sha256sums_aarch64=('be6151c5e29fb67009d35be2e62cd29b8dcd58e2fdc16adaa32a2b4dadd78961')

package() {
  install -Dm755 "zaparoo" "${pkgdir}/usr/bin/zaparoo"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

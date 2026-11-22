# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mlbt-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A tui for the MLB Statcast API"
arch=('x86_64' 'aarch64')
url="https://github.com/mlb-rs/mlbt"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mlb-rs/mlbt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mlbt-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mlbt-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('e273bbf774a576be27a00d906cdaa0348e859d6a9fec80649fed065bb9aef2f4')
sha256sums_x86_64=('06c8c43ec9acbab4470e8857cc199a09174bb7a784943946dffd0307cf8ca771')
sha256sums_aarch64=('61c4f74365f367e86225819948e5c20d9d74dc295a95069d0ed5f79821b604fc')

package() {
  install -Dm755 "mlbt" "${pkgdir}/usr/bin/mlbt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

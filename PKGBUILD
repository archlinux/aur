# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rotel-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Resource-efficient OpenTelemetry collector"
arch=('x86_64' 'aarch64')
url="https://github.com/rotel-dev/rotel"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rotel-dev/rotel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rotel_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rotel_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('8f4530006034775e9089a86c1e4aca1c26f7b8416daf394334cff37e84d31eee')
sha256sums_aarch64=('9e68282b6a2f667f56f793c055d496d258a25fbed4cb2c013a56dcf4fcd9e74e')

package() {
  install -Dm755 "rotel" "${pkgdir}/usr/bin/rotel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

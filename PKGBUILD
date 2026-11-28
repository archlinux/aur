# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=psfuzz-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Directory and path web fuzzing scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/Proviesec/PSFuzz"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Proviesec/PSFuzz/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/psfuzz-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/psfuzz-linux-arm64")
sha256sums=('7651ea66581a296a61c4477a811932fdcf6ec660be85e0f413f1630d3045a9a0')
sha256sums_x86_64=('0c9ebfd6912775fb63c76f8044a561b7bf766295496a225131560e7d9ff1c44b')
sha256sums_aarch64=('75c56f37f8b650f771bbe80423247bd719a76a300e695b4240096ecff0aac609')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/psfuzz"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

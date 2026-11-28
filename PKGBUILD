# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zedra-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Remote control for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/deltaqdev/zedra"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/deltaqdev/zedra/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zedra-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zedra-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('6af94aab0964ee8afe33ad803b43d265d3ca45d8b0fabee21c60fcb56a7fde8a')
sha256sums_x86_64=('271014d86221ca3e6fba009a3b00320cba5e909fe3fe5a1263a9d1eceb32a9f1')
sha256sums_aarch64=('730da312eb0c307e144b22e281d6b0a6b9b0653263776ff9eda2e71aecb7b0f6')

package() {
  install -Dm755 "zedra" "${pkgdir}/usr/bin/zedra"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=groma-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Keep your architecture as Markdown in Git"
arch=('x86_64' 'aarch64')
url="https://github.com/mrlesk/groma.md"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mrlesk/groma.md/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/groma-bun-linux-x64-baseline")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/groma-bun-linux-arm64")
sha256sums=('b97c251e502d39094c7110c14f1c912d5b0cd30c4b03cd30b4f7a9f776960c48')
sha256sums_x86_64=('c40675ccd7c41372fbef98fbb1d708ff7089e8ea8602ad56618061f2b2a85808')
sha256sums_aarch64=('9d21e821544bd61ed910403e49662e34f30c9e9159920889d743e13fdb809f83')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/groma-bun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

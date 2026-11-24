# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=groma-bin
pkgver=0.7.8
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
sha256sums_x86_64=('bd7a83d04c75b7406d4107022ef3e6cc6959315fe4aa2efce6cea4367fe1162d')
sha256sums_aarch64=('b67d8d3aedc1ed2ee1e1b05d513e7b5cd014280aa3fda09b8db4bb414fc6024c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/groma-bun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

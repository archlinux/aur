# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gauge-bin
pkgver=1.6.44
pkgrel=1
pkgdesc="Light weight cross-platform test automation"
arch=('x86_64' 'aarch64')
url="https://github.com/getgauge/gauge"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/getgauge/gauge/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gauge-${pkgver}-linux.x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gauge-${pkgver}-linux.arm64.zip")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('c7713fb30d77299970333a39aed1ae4d044ddbd2cfd8b3628f28020dff2a0e57')
sha256sums_aarch64=('91fdc83d80faa97611763c37022033ae4b8131d3d746e3bfc7bd6d8fa46b651b')

package() {
  install -Dm755 "gauge" "${pkgdir}/usr/bin/gauge"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

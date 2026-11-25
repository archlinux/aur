# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kagent-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Cloud Native Agentic AI | Discord: https://bit.ly/kagentdiscord"
arch=('x86_64' 'aarch64')
url="https://github.com/kagent-dev/kagent"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kagent-dev/kagent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/kagent-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/kagent-linux-arm64")
sha256sums=('3b1ee5b1e14fda40515c18ec2f0796d632e65a20b2aca8f017c654bc26ca77bd')
sha256sums_x86_64=('f188182aaf445e5707ab8d3458f394fa30f875cc1786ec4f12a30b9fa0a8d77f')
sha256sums_aarch64=('a6ec9809094cdab0f3de6f662309f6accfa645cb8d5eec1551469689c73589e5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kagent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

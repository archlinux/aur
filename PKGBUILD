# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ordewell-bin
pkgver=0.14.16
pkgrel=1
pkgdesc="Turn one goal into a plan graph run by parallel coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/ordewell/ordewell"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ordewell/ordewell/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ordewell-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ordewell-linux-arm64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('febcf74fa154f7b1007cd1534b861bbcc2ed9bec1f452fb21b4c780ed2542318')
sha256sums_aarch64=('568a0b22477f637eef755e1338c4fc1d7c13ac184d84876c7157644ed0aa0539')

package() {
  install -Dm755 "ordewell" "${pkgdir}/usr/bin/ordewell"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

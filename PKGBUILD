# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=digler-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Forensic disk analysis and file recovery tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ostafen/digler"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ostafen/digler/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/digler-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/digler-linux-arm64")
sha256sums=('ca5ae13ec006328e844f403aa2c322f6e4cb30fee8a28de61388380c9f99fe61')
sha256sums_x86_64=('f253b328cb655a6a8ba1e5c67bd29ced63940c068275a624d17277484a4cdc2c')
sha256sums_aarch64=('d3020e9ac132eb15e27b610ba48c3b669466c7d29c333406cc1cded506f437ca')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/digler"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

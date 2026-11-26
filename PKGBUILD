# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flamingo-bin
pkgver=0.0.20
pkgrel=1
pkgdesc="Capture credentials sprayed across the network by IT and security products"
arch=('x86_64' 'aarch64')
url="https://github.com/atredispartners/flamingo"
license=('BSD-2-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/atredispartners/flamingo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/flamingo-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/flamingo-linux-aarch64")
sha256sums=('c61411f79c602effd6938c78d629c307557d6a35f1f129edbcb237b0cea32c4e')
sha256sums_x86_64=('35151cc0915175b7debcc8f1d767f967216d8d8f789174cb4b89599e3e0e1f94')
sha256sums_aarch64=('558a553da952e0d47ac6b98de48b07f16bd6a9ef0af02c33c38c0088b15d3022')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/flamingo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

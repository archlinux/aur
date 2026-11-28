# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=squeez-bin
pkgver=1.50.0
pkgrel=1
pkgdesc="Hook-based token compressor for AI coding CLIs"
arch=('x86_64' 'aarch64')
url="https://github.com/claudioemmanuel/squeez"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/claudioemmanuel/squeez/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/squeez-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/squeez-linux-aarch64")
sha256sums=('0ad859ba49ea50268b7cc3f2e9e670fd9b724a6df1b949c263d6f35a173ba087')
sha256sums_x86_64=('20e3b0eaec5be5e5f79128e311399597829cac50d0fe28782fadeb811c6bed0c')
sha256sums_aarch64=('6fc4ac3669c083c6d87d1e1e12df562c41149704f0abeb05e106e01d774a66c1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/squeez"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

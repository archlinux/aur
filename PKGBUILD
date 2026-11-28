# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=binance_l3_est-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Estimate Binance L3 order book microstructure from L2 data"
arch=('x86_64')
url="https://github.com/OctopusTakopi/binance_l3_est"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/OctopusTakopi/binance_l3_est/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/binance_l3_est-Linux-X64")
sha256sums=('013a2b45b668f91564a46fece170907cafd4c1e86a1396531acea481eaf9d22b')
sha256sums_x86_64=('e08d704822eec71e6e36fcf9cf55ebc1a84f8a83cbb3b196abbe2a6ece1022c0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/binance_l3_est"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

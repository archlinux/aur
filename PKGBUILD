# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nowhere-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="TCP and UDP relay over TLS and QUIC"
arch=('x86_64' 'aarch64')
url="https://github.com/NodePassProject/Nowhere"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/NodePassProject/Nowhere/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nowhere-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nowhere-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c05aecf60628f61ee41b664a1d9fc51f448b65143e5dda5988f2199691cda5d5')
sha256sums_x86_64=('e2fe08c135198415e73495b6835e45e3a512f4cdf347a2ffe6871367929c2e34')
sha256sums_aarch64=('2acf03a50b7be4b85280f5093e9f083cbb507603088fb6bd3eb2b5063104b316')

package() {
  install -Dm755 "nowhere" "${pkgdir}/usr/bin/nowhere"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

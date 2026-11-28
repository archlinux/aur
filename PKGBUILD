# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tylertoo-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Convert GeoParquet to PMTiles"
arch=('x86_64')
url="https://github.com/geoparquet-io/tylertoo"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tylertoo-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('92daaac548a81f8e1e60093e293cc1d02c489ed6cf3a57f076a4bbf781b47969')

package() {
  install -Dm755 "tylertoo-${pkgver}-x86_64-unknown-linux-gnu/tylertoo" "${pkgdir}/usr/bin/tylertoo"
  install -Dm644 "tylertoo-${pkgver}-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "tylertoo-${pkgver}-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

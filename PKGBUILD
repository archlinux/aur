# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=joincap-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Merge multiple pcap files together, gracefully"
arch=('x86_64')
url='https://github.com/assafmo/joincap'
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.zip::https://github.com/assafmo/joincap/releases/download/v${pkgver}/joincap-linux64-v${pkgver}.zip"
    'LICENSE::https://raw.githubusercontent.com/assafmo/joincap/master/LICENSE')
sha256sums=('16b789223e6edf388ab433c13552b52dd4986d8862da60adccf75882d597d043'
      '4ddfa7d5acfe680c6594d8709439415d05876090e2f3abc3acff1640266a0270')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}-linux64-v${pkgver}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
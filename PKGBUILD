# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mavp2p-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Flexible and efficient MAVLink router"
arch=('x86_64')
url="https://github.com/bluenviron/mavp2p"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bluenviron/mavp2p/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mavp2p_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('ecae73b0a23185a35a1222edc0aae5245bb9739420bad0125b0c42e935301a80')
sha256sums_x86_64=('510121bf7b7d71805ee1380fbe348b36bdab36ba0e50e9b0bea50066509695d5')

package() {
  install -Dm755 "mavp2p" "${pkgdir}/usr/bin/mavp2p"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

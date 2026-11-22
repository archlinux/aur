# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazymqtt-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A keyboard-driven terminal client"
arch=('x86_64')
url="https://github.com/ScottFelder/lazymqtt"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ScottFelder/lazymqtt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazymqtt-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('164aa16605422fbb68b5c5ae745ed2b15b75d0b3e684c400273ee57b7f53be67')
sha256sums_x86_64=('6d310fb595009757b412c5c9de645e098ce5dda8fbbe5ef35dcdaedad3eab8bc')

package() {
  install -Dm755 "lazymqtt" "${pkgdir}/usr/bin/lazymqtt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

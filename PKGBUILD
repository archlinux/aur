# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=quickpassthrough-bin
pkgver=2.1.5
pkgrel=1
pkgdesc="Simplify GPU passthrough setup for QEMU"
arch=('x86_64')
url="https://github.com/HikariKnight/quickpassthrough"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/quickpassthrough_Linux_x86_64.tar.gz")
sha256sums_x86_64=('67c803b484d9ff46cd5fc8008adcb574a814ef58bec3402f0b74fa0dd02ee327')

package() {
  install -Dm755 "quickpassthrough" "${pkgdir}/usr/bin/quickpassthrough"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iron-sensor-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="eBPF-based behavioral monitor for AI coding agents"
arch=('x86_64')
url="https://github.com/ironsh/iron-sensor"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/iron-sensor_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('59b52c29f2a0e42caf6815ac35e7a84f8886be1a7c1656eb9de561cb115ac48c')

package() {
  install -Dm755 "iron-sensor" "${pkgdir}/usr/bin/iron-sensor"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

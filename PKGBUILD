# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=outflux-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Export data from InfluxDB to TimescaleDB"
arch=('x86_64' 'aarch64')
url="https://github.com/timescale/outflux"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/outflux_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/outflux_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('be4736b1d241080dd3dcd6effcdb0b37f464c25c38bedabda485e213c2484ef2')
sha256sums_aarch64=('b49b68dc2fdbb1fdb45a493b9f32f9e2a151e31e839cd663184276b454605ce4')

package() {
  install -Dm755 "outflux" "${pkgdir}/usr/bin/outflux"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

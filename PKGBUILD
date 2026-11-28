# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=outside-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Multi-purpose terminal weather client"
arch=('x86_64' 'aarch64')
url="https://github.com/BaconIsAVeg/outside"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/outside-${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/outside-${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('28568c09a05ba9b254491d12531fee9237e7d8c081e01281cf0cfaec43c388ad')
sha256sums_aarch64=('60a8749558e1b466fdf96ddf89e4c8d51a43bdcc1a704a2e9c680b614a79e24a')

package() {
  install -Dm755 "outside" "${pkgdir}/usr/bin/outside"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

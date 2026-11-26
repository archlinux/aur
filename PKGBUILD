# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rospo-bin
pkgver=0.15.3
pkgrel=1
pkgdesc="Persistent SSH tunnels with an embedded server"
arch=('x86_64' 'aarch64')
url="https://github.com/ferama/rospo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ferama/rospo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/rospo-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/rospo-linux-arm64")
sha256sums=('b20f153ec7dbb655ddeaf92b8ffaf26de6c1a6d1d03e587b31212df8cf768b04')
sha256sums_x86_64=('2e9d8147091e0068808985a7489219f48358bf339da81c30e573f56c45aa40b4')
sha256sums_aarch64=('90c516b1d7994600a473fc8779d9b3a2f5baab0b566894a0fe51354024867469')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rospo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

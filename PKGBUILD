# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ehco-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="Network relay and tunnel tool"
arch=('x86_64' 'aarch64')
url="https://github.com/Ehco1996/ehco"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Ehco1996/ehco/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ehco_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ehco_linux_arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('0167a8f8037ff588e8468511bc0a162029e54e7cc48cf031205be3351916eec1')
sha256sums_aarch64=('e4bdf62bfdbabad1d8e12ffc84c6b7c9e0e5b6456b64722ffdf4990905afe395')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ehco"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

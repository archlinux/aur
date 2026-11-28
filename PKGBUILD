# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sinowisp-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Read and write flash on Sinowealth 8051-based HID devices"
arch=('x86_64')
url="https://github.com/karstx/sinowisp"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/karstx/sinowisp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sinowisp-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz")
sha256sums=('a10143a4ad981253b0433d30681bda26662aad54c409584bb0d7d5eaf1696638')
sha256sums_x86_64=('292e2cedf97f7fd382333919a3e589f63da65435b26c604ac0598ad9a5e61428')

package() {
  install -Dm755 "sinowisp" "${pkgdir}/usr/bin/sinowisp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

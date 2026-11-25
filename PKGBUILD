# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=toughradius-bin
pkgver=9.4.0
pkgrel=1
pkgdesc="RADIUS server for ISPs, enterprise networks and carriers"
arch=('x86_64' 'aarch64')
url="https://github.com/talkincode/toughradius"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/talkincode/toughradius/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/toughradius_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/toughradius_linux_arm64")
sha256sums=('7538072c5f3a33968503503ef849e6d79590d17e3b75a438b988e616e0b53041')
sha256sums_x86_64=('52e23dc02687da690c09755d9a32d52d1af0a8476705701814b42afdd7012e5e')
sha256sums_aarch64=('f5c43cc6f714f11b950a0b5e01b7cb005d2dcb3b40468d1869c907855e693073')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/toughradius"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

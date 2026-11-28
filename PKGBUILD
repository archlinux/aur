# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stratum-ping-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Stratum mining pool latency tester"
arch=('x86_64')
url="https://github.com/2miners/stratum-ping"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/2miners/stratum-ping/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stratum-ping-linux-x64.tar.gz")
sha256sums=('a76282a8e6622341d371a369672a64e1224796f8029b351fa39f461563e549c1')
sha256sums_x86_64=('11415fbe19ffac6781528e84a126a2ad091f1bcb583adb34931735d77ccfcddc')

package() {
  install -Dm755 "stratum-ping" "${pkgdir}/usr/bin/stratum-ping"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

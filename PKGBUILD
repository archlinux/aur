# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=future-os-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="AI agent for the terminal and beyond"
arch=('x86_64' 'aarch64')
url="https://github.com/futuregene/future-os"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/futuregene/future-os/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/FutureOS_${pkgver}_linux_x86_64-cli.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/FutureOS_${pkgver}_linux_aarch64-cli.tar.gz")
sha256sums=('b20ef48ed582c0f4b39c29f81217fedfb0fd836c7bd7448eccf28fb27a2e786d')
sha256sums_x86_64=('30adbc1abee742a0121b867e33894a1ced960985fb4865743edd4ecc4c5124f7')
sha256sums_aarch64=('2c597520b1298b11f3392fa6c69a9aa53ee127243317ee0090de995476886ecd')

package() {
  install -Dm755 "future" "${pkgdir}/usr/bin/future"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

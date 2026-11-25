# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dungbeetle-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Distributed job server for queuing and running heavy SQL read jobs asynchronously"
arch=('x86_64')
url="https://github.com/zerodha/dungbeetle"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dungbeetle_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('5e48dc79871399bef2553ce134608a4161a676f24a645adf154b8b00a4de7d33')

package() {
  install -Dm755 "dungbeetle" "${pkgdir}/usr/bin/dungbeetle"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

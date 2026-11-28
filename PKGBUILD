# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nextdhcp-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="DHCP server with chainable middlewares"
arch=('x86_64')
url="https://github.com/nextdhcp/nextdhcp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nextdhcp_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('704b52347a2b141d9402add308396fadb45367922fcb42c8959b97ea935951d3')

package() {
  install -Dm755 "nextdhcp" "${pkgdir}/usr/bin/nextdhcp"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

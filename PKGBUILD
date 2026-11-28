# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wirez-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Redirect a program's TCP and UDP traffic to a SOCKS5 proxy"
arch=('x86_64')
url="https://github.com/v-byte-cpu/wirez"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wirez_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('202eeade6b8099d67be24f61ecdd1e4771d6bc84bb21647d6a3b725d8a0e4c4f')

package() {
  install -Dm755 "wirez" "${pkgdir}/usr/bin/wirez"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

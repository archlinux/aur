# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=whalewall-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Automatically manage firewall rules for Docker containers"
arch=('x86_64')
url="https://github.com/capnspacehook/whalewall"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/capnspacehook/whalewall/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/whalewall_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c3397ed0db90e11f2d4f111fce2197217e555c1cd87fe35b87de10ea45734636')
sha256sums_x86_64=('18fcb31b72f68482510a5a9274c3c0a00d04593faa0cb02a6c79a276e6841273')

package() {
  install -Dm755 "whalewall" "${pkgdir}/usr/bin/whalewall"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

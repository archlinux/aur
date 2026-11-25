# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openp2p-bin
pkgver=3.25.11
pkgrel=1
pkgdesc="Lightweight P2P networking and port forwarding tool"
arch=('x86_64' 'aarch64')
url="https://github.com/openp2p-cn/openp2p"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openp2p-cn/openp2p/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openp2p-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openp2p-${pkgver}.linux-arm64.tar.gz")
sha256sums=('c673b306403aa1171044f749f25e5bb701f710328445d83adacc6784e8a26f75')
sha256sums_x86_64=('cd53825feba1ee489f2046427178c76b1ba6fc71a7cc32f3700f2ddeeb4d9e36')
sha256sums_aarch64=('c3e25450c4d8f12138e81f979cf3df34843e2c9476145a477e42bc5f75f2e0ea')

package() {
  install -Dm755 "openp2p" "${pkgdir}/usr/bin/openp2p"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

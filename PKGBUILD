# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webhookx-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Webhooks gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/webhookx-io/webhookx"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/webhookx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/webhookx_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('877bd1770a239abafe645d801c604c6d1b1274c997586a80d089d188de8f476a')
sha256sums_aarch64=('2089ad012e127cd4ffee7562edd9fe30b5290ba912b4753b53b182dc91d05a58')

package() {
  install -Dm755 "webhookx" "${pkgdir}/usr/bin/webhookx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

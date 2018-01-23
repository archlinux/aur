# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=signet
pkgver=0.9.8
pkgrel=1
pkgdesc="Desktop Client for Signet"
arch=('x86_64')
url="https://nthdimtech.com/signet-releases/"
license=('GPLv3')
provides=('signet')

source_x86_64=("http://nthdimtech.com/downloads/signet-releases/${pkgver}/gnu-linux/signet-${pkgver}.1"
               "http://nthdimtech.com/downloads/signet-releases/${pkgver}/gnu-linux/50-signet.rules"
               "https://www.gnu.org/licenses/gpl.txt")
sha256sums_x86_64=('ca35680459a88abbfc5850cdce387a8804ca35f2e8fce50a1ae6b601ef82b5cd'
                   'af34a217fee566de4c149429459e4cd13f38435857ff8c9f5fd7bb0199e86820'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "${srcdir}/signet-${pkgver}.1" "${pkgdir}/usr/bin/signet"
  install -Dm666 "${srcdir}/50-signet.rules" "${pkgdir}/etc/udev/rules.d/50-signet.rules"
  install -Dm644 "${srcdir}/gpl.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

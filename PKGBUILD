# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=unipager-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="Universal POCSAG transmitter controller written in Rust."
arch=('x86_64')
url="https://github.com/rwth-afu/unipager"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "unipager-x86_64.tar.gz::https://github.com/rwth-afu/UniPager/releases/download/v${pkgver}/unipager-x86_64.tar.gz"
  "unipager.service::https://raw.githubusercontent.com/rwth-afu/UniPager/v${pkgver}/debian/unipager.service"
)
sha256sums=(
  '95d520059cb700732b867432040db671d1fdaa0420be05df0dedf84534604ec7'
  'acfca4d2bf51c911b68837a315165987d7eb17665311118a23cefd63334f0897'
)

package() {
  install -Dm 755 unipager "${pkgdir}/usr/bin/unipager"

  install -Dm 644 unipager.service "${pkgdir}/usr/lib/systemd/system/unipager.service"
  install -dDm 644 "${pkgdir}/var/lib/unipager"
}

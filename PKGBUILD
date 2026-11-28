# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-smtp-mock-bin
pkgver=2.5.4
pkgrel=1
pkgdesc="SMTP mock server for testing"
arch=('x86_64' 'aarch64')
url="https://github.com/mocktools/go-smtp-mock"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/smtpmock_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/smtpmock_Linux_arm64.tar.gz")
sha256sums_x86_64=('c4fd29278589b3a42660644778436e5151baf3c796ff6b19c94c51a458cfc86e')
sha256sums_aarch64=('4c4304b582c3749ab25baae684d253e4bf72e917dce1f041853bdf5ab0db4e96')

package() {
  install -Dm755 "smtpmock" "${pkgdir}/usr/bin/smtpmock"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cisshgo-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Concurrent SSH server that poses as Cisco IOS for testing"
arch=('x86_64' 'aarch64')
url="https://github.com/tbotnz/cisshgo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cisshgo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cisshgo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ab155a1e9bd0635e054cb2972f1cdc6f21fb405e6f53d6f68aceb2e0121480c2')
sha256sums_aarch64=('9d02db037a721d08c42a7c86f2cc2b7e36a94c4664656006a39aeb28759d24ec')

package() {
  install -Dm755 "cisshgo" "${pkgdir}/usr/bin/cisshgo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

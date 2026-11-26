# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cashier-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Self-service certificate authority for OpenSSH"
arch=('x86_64' 'aarch64')
url="https://github.com/cashier-go/cashier"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cashier_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cashier_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('88964a67e5c6e9a3910b14f0abc0a86f4ac8c000942762ab6e33d88621ce4cf4')
sha256sums_aarch64=('b31121bbc7a5272acfba049bad7e10c430ade785ff35d1d54d610f2061662953')

package() {
  install -Dm755 "cashier" "${pkgdir}/usr/bin/cashier"
  install -Dm755 "cashierd" "${pkgdir}/usr/bin/cashierd"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=onedump-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Database dump and administration tool"
arch=('x86_64' 'aarch64')
url="https://github.com/liweiyi88/onedump"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/onedump_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/onedump_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e179ec3394d14f6d6f798ef3bdb89618237ba6099d2f381aaa8cadbd23ff5eee')
sha256sums_aarch64=('5eded9acb3027f05594fc6564f3483c322854da0b79ee81997c548cb3a03993f')

package() {
  install -Dm755 "onedump" "${pkgdir}/usr/bin/onedump"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

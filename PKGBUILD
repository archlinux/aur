# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zeroid-bin
pkgver=1.34.0
pkgrel=1
pkgdesc="Identity management for autonomous AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/highflame-ai/zeroid"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zeroid_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zeroid_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a1bb000ae966620c96a8ecccdae5a8d0ec4f23c2a5d47e4d33a9dcb9b67d1f82')
sha256sums_aarch64=('78ffc426e9e6065c197f4ecced68da792a18287a7abc5da271495e2c1b0cab41')

package() {
  install -Dm755 "zeroid" "${pkgdir}/usr/bin/zeroid"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

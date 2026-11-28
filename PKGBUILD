# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goexec-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Windows remote execution multitool"
arch=('x86_64' 'aarch64')
url="https://github.com/FalconOpsLLC/goexec"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goexec_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goexec_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5ea64a78b6e4647a4d06d2664827bde74011fe663cc2c4efaf549becc75fdde0')
sha256sums_aarch64=('d1b40a1ffbb12171f17f17397fff182247b763f6f0c6f255aaad3abb7f8ad793')

package() {
  install -Dm755 "goexec" "${pkgdir}/usr/bin/goexec"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

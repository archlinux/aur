# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grom-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="btop-style terminal dashboards for Prometheus and Grafana"
arch=('x86_64' 'aarch64')
url="https://github.com/qf-studio/grom"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/grom_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/grom_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('91b8e76d37a9747355f982163a2056ab36480a43cc6431e86a79851fbc5229d4')
sha256sums_aarch64=('fd7716d1c180bce6e58b1a676a3a9f91273cca9e760a184fd7e79060883b8a16')

package() {
  install -Dm755 "grom" "${pkgdir}/usr/bin/grom"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

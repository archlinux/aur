# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pi-go-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Go implementation of the pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/dimetron/pi-go"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pi-go_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pi-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9f8e02bb3de7bdc502def3676d106453e8ed9564a1faf4b7d3609a2d8219fdb8')
sha256sums_aarch64=('090dd604411d1987dd8d4cc8b8074635db0f0ac07ab1d84b55638777d82d000f')

package() {
  install -Dm755 "pi" "${pkgdir}/usr/bin/pi-go"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

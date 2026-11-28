# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goaway-bin
pkgver=0.63.17
pkgrel=1
pkgdesc="Lightweight DNS sinkhole with a web dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/pommee/goaway"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goaway_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goaway_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d0f9f912eed47d79d60dd9d9013bd43da4fece7cb9c5087571a7277c50ee2803')
sha256sums_aarch64=('c302d94ca57126bee8dfc57c3b442ce2668a87bdacf68c0f4b3620989a6e0f15')

package() {
  install -Dm755 "goaway" "${pkgdir}/usr/bin/goaway"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

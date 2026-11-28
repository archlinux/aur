# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llmio-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="LLM gateway with weighted load balancing, observability and cost tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/atopos31/llmio"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llmio_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llmio_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5192f95c54eb9aff6bf95dcad5fab2712a13f7b393eb83c1267032b2f37d3dde')
sha256sums_aarch64=('87850251391670268736c7a35473cdebca68842dc2f662c5d83a3728431b570d')

package() {
  install -Dm755 "llmio" "${pkgdir}/usr/bin/llmio"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

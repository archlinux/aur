# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=phi-bin
pkgver=0.30.1
pkgrel=1
pkgdesc="Fast coding agent with sub-agents and MCP support"
arch=('x86_64' 'aarch64')
url="https://github.com/pulseaiclub/phi"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/phi_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/phi_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d341a5417f26713eb37556757044920d2763b45ce1eb9c7dbad8a9a519c92331')
sha256sums_aarch64=('83180fc8ed4d3c5b54cbd1da489067e556da2681b4b2d20e214c95bd3fffb0ac')

package() {
  install -Dm755 "phi" "${pkgdir}/usr/bin/phi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

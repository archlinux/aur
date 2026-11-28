# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prometheus-mcp-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="MCP server for interacting with Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus/prometheus-mcp"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prometheus-mcp-server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/prometheus-mcp-server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('50030346594a4b8d89294f3a2cb9e253caa0bd75e69fefbd9add289cafd6c27c')
sha256sums_aarch64=('e4027f7a47178a3d69ac0974b5cbef5312a855d43b60a4a2686a3db83ed8461e')

package() {
  install -Dm755 "prometheus-mcp-server" "${pkgdir}/usr/bin/prometheus-mcp-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

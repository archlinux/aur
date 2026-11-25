# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcp-proxy-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="MCP proxy that aggregates multiple MCP servers behind one HTTP server"
arch=('x86_64' 'aarch64')
url="https://github.com/tbxark/mcp-proxy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcp-proxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcp-proxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f00212ba9d1d09194f06538f09348f2fcd9458c5516fb5213b927e6183bc3e98')
sha256sums_aarch64=('2a4b5c26916a8b1e2f15136c240bdc1ed945b9ea97201f0cb7c53a32599c2952')

package() {
  install -Dm755 "mcp-proxy" "${pkgdir}/usr/bin/mcp-proxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

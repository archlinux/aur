# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=razorpay-mcp-server-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="MCP server for the Razorpay API"
arch=('x86_64' 'aarch64')
url="https://github.com/razorpay/razorpay-mcp-server"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/razorpay-mcp-server_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/razorpay-mcp-server_Linux_arm64.tar.gz")
sha256sums_x86_64=('17dc9cad8dfb09b82a953b7bc320ff45bc6dc098329c65c51ad5a62190e7ab11')
sha256sums_aarch64=('2f74180336f811b2e0bb34814d8c08696341f518f2d9bcb61bc93b820b60e562')

package() {
  install -Dm755 "razorpay-mcp-server" "${pkgdir}/usr/bin/razorpay-mcp-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcpjungle-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="One place to manage & connect to all your MCP servers"
arch=('x86_64' 'aarch64')
url="https://github.com/mcpjungle/MCPJungle"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcpjungle_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcpjungle_Linux_arm64.tar.gz")
sha256sums_x86_64=('43bf2d5b0faa26e267619b8c6a34cc6b97710e1486f9e23db63ddd1c2b4b766c')
sha256sums_aarch64=('8b095bf3b5281da64f2829f39aab2eea41ee56b6879b83b5b0fa3e8e17098771')

package() {
  install -Dm755 "mcpjungle" "${pkgdir}/usr/bin/mcpjungle"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

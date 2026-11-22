# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orbit-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="An autonomous AI coding agent and Model Context Protocol (MCP) client powered by OpenRouter"
arch=('x86_64')
url="https://github.com/dwaddle/orbit-cli"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/orbit-cli-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('01934df5d0bea8db19362c1cbb6e6b4c7b4976db511c42d0e095d8c080b53092')

package() {
  install -Dm755 "orbit" "${pkgdir}/usr/bin/orbit"
  install -Dm755 "orbit-cli" "${pkgdir}/usr/bin/orbit-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

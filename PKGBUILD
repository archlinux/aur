# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=atlassian-tui-bin
pkgver=0.8.10
pkgrel=1
pkgdesc="Jira and Confluence in the terminal with a TUI, CLI, HTTP API and read-only MCP mode"
arch=('x86_64' 'aarch64')
url="https://github.com/BiteFoundry/atlassian"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/atlassian-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/atlassian-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('73ec0c96c295f812a45bcb5bf6e852f637a2f337126a6b2c99da5b29fe0a5c39')
sha256sums_aarch64=('b114a0a36d6c16dcb7ae2b50a042ea2731628aa7e740560f3d81f28155b4789f')

package() {
  install -Dm755 "atlassian" "${pkgdir}/usr/bin/atlassian"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

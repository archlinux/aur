# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=atlassian-tui-bin
pkgver=0.8.1
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
sha256sums_x86_64=('8104c70195ca8ed6d2827a98bd0f8e15dd74d2145c190e27f9478c5344fbaedc')
sha256sums_aarch64=('b491514165f7edfaacad6204b9aa4ff32dc50d63c53dbcc81b308ff788d6c6ea')

package() {
  install -Dm755 "atlassian" "${pkgdir}/usr/bin/atlassian"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

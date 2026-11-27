# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=atlassian-tui-bin
pkgver=0.8.8
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
sha256sums_x86_64=('f1535b725ceeb209844e953f0734ae78206c493aa066eba47583c4444d7d8e83')
sha256sums_aarch64=('d2569667d0bb1606ad6528bdcc6da7def6f1fbd63631cf251fee050af1bf053c')

package() {
  install -Dm755 "atlassian" "${pkgdir}/usr/bin/atlassian"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

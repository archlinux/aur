# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=atlassian-tui-bin
pkgver=0.8.4
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
sha256sums_x86_64=('4094d593c64735ad48985ee0b799fb31f7076a4cfad1256d5166642262312b78')
sha256sums_aarch64=('bd76828ec6e7a281dd86b98644ce6fa227a1d06511972b5aeba1162f7d36d09a')

package() {
  install -Dm755 "atlassian" "${pkgdir}/usr/bin/atlassian"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

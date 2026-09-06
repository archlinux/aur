# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="CLI and MCP server for UGREEN NAS (UGOS) management"
arch=('x86_64' 'aarch64')
# Ein -bin-Paket liefert die Binaerdateien des Upstream aus, also
# unveraendert. makepkg wuerde sie sonst strippen und die
# Debug-Symbole abspalten; das Paket enthielte dann andere Bytes als
# das Release-Archiv, und der Vergleich danach koennte nie stimmen.
options=('!strip' '!debug')
url="https://github.com/metaneutrons/ugos-cli"
license=('GPL-3.0-or-later')
provides=('ugos-cli')
conflicts=('ugos-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a507b7df0362ecc53e185663733ab333ebf9942783e6bad7bfa2377923afcb24')
sha256sums_aarch64=('6dc07aeb815e7e696ff9b73de562d03053f99511d50494d147f86546c3b80ce6')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

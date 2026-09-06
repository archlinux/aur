# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.14.0
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2d6ca55f7280dc7be56c57d6ccf006be6179a26348c914c1c86e5e0db0c5ba70')
sha256sums_aarch64=('1862f178e109591983b830414a05ba6f22a22a0dd046505ded9089b6d01b527e')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

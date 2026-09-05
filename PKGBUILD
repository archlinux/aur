# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.13.2
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('10455e8c8c108e9057548bd2a7ddbf22a66d8590faab0822a736ec1d221d4f81')
sha256sums_aarch64=('3fdf9fe1379e7122e94ac22d9cd47808adc864f4256f67fd5a024a9477a97077')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

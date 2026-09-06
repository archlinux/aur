# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.14.1
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('930ab7244ea988502d6f4f9ad771641b388ac6f70f8abb057b0ee7a9f6b471a2')
sha256sums_aarch64=('12b8d6889e34e48d0504d354d25a469f24878e04498eb3c04df49b51ae2c1f18')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

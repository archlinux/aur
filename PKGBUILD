# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.13.1
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ef94f203ec7b4c6e43d9663cb43b50118dfcf291991976a8645c959cbb061582')
sha256sums_aarch64=('8d1d1da2a688167939ed4cff6655d193f2d22ffe296155d23cc9db9b1d99c62a')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="CLI and MCP server for UGREEN NAS (UGOS) management"
arch=('x86_64' 'aarch64')
# A -bin package ships the upstream binaries, which means unchanged.
# makepkg would otherwise strip them and split off the debug symbols;
# the package would then hold different bytes than the release
# archive, and the comparison afterwards could never match.
options=('!strip' '!debug')
url="https://github.com/metaneutrons/ugos-cli"
license=('GPL-3.0-or-later')
provides=('ugos-cli')
conflicts=('ugos-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1902bef97d165889dbd6b99cc2182c9de7de894269204d4a8ddeeb63284d72d5')
sha256sums_aarch64=('a2c4c1afe26b2194c151b3aee69588ec3014a788185fbb39c4db5ca05d67235f')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

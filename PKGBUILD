# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.21.0
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3f2ee977bfbed03e5eeb29a88a95e31429d52359dce8b35326d02cb5a922d465')
sha256sums_aarch64=('34c5835e040ce42d73477451c1bdf9a045afcb44c2a83af4add85282b6683c13')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

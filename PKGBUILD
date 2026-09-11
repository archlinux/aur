# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=ugos-cli-bin
pkgver=0.14.3
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('27f94596ec385de03cdf7bcdea59d6ecb8d4b047ab12011dc794f6310f9761bc')
sha256sums_aarch64=('a44d66e7f0e2351cddf8d3b1c97eee74a0d4bb6c868096ffd568aa4257741a84')

package() {
  install -Dm755 "${srcdir}/ugos-cli" "${pkgdir}/usr/bin/ugos-cli"
  install -Dm755 "${srcdir}/ugos-mcp" "${pkgdir}/usr/bin/ugos-mcp"
}

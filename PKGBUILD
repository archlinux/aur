# Maintainer: agony <27015 at riseup dot net>

pkgname=whodb-cli-bin
pkgver=0.138.0
_cli=whodb-cli
pkgrel=1
pkgdesc='Database management CLI with a TUI and an MCP server (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/clidey/whodb'
license=('Apache-2.0')
depends=('glibc')
depends_x86_64=('libgcc' 'libstdc++')
depends_aarch64=('libgcc' 'libstdc++')
provides=("whodb-cli=${pkgver}")
conflicts=('whodb-cli')
install=whodb-cli.install
_release="${url}/releases/download/${pkgver}"
source_x86_64=("${_cli}-${pkgver}-linux-amd64::${_release}/${_cli}-linux-amd64")
source_aarch64=("${_cli}-${pkgver}-linux-arm64::${_release}/${_cli}-linux-arm64")
source_armv7h=("${_cli}-${pkgver}-linux-armv7::${_release}/${_cli}-linux-armv7")
sha256sums_x86_64=('ce36f4b3cb535119a59b3e764c64537c0d3fcf0483c8fcf678da71339dbc823e')
sha256sums_aarch64=('fea566bffd3c4f0d4b2670a769d9776a47d586620c63c7dea19617c7ef601f70')
sha256sums_armv7h=('105cdd2e44aac813eadde003df6868de244be7bf1a6806868e19eac564bb68b4')

package() {
  install -Dm755 "${_cli}-${pkgver}"-linux-* "${pkgdir}/usr/bin/whodb"
}

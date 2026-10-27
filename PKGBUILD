# Maintainer: agony <27015 at riseup dot net>

pkgname=whodb-cli-bin
pkgver=0.136.0
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
sha256sums_x86_64=('c98475946908ebc007e75307c51141347dcb135b08467694678f2f162a75dfca')
sha256sums_aarch64=('e60a981e96d06bf246352adf5e2910e15b3479cec00f0bf68198a0e1b9c1a375')
sha256sums_armv7h=('09674bdac77572a89eeb3479b1eb4a899747f8759f151e0fbbb9b4a3230a5186')

package() {
  install -Dm755 "${_cli}-${pkgver}"-linux-* "${pkgdir}/usr/bin/whodb"
}

# Maintainer: agony <27015 at riseup dot net>

pkgname=whodb-cli-bin
pkgver=0.139.0
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
source=("whodb-${pkgver}-NOTICE::https://raw.githubusercontent.com/clidey/whodb/${pkgver}/NOTICE")
source_x86_64=("${_cli}-${pkgver}-linux-amd64::${_release}/${_cli}-linux-amd64")
source_aarch64=("${_cli}-${pkgver}-linux-arm64::${_release}/${_cli}-linux-arm64")
source_armv7h=("${_cli}-${pkgver}-linux-armv7::${_release}/${_cli}-linux-armv7")
sha256sums=('37540f248340b95d3a57125a8c5bda9a5a5cd332ec747d0ca15e2d7b83c5f4c0')
sha256sums_x86_64=('7e6bc8b9865f90b892528ed5ccb6fe2b3b9f6338cb01bbbc91ec07c06c4b6ba3')
sha256sums_aarch64=('a6cc76b21276a8e58191d31db322be0ea2963361808d5d71110fdaa652e1d174')
sha256sums_armv7h=('b5088c258184095c582047453ab76467588d1db7560c01ddd479eb99df46d369')

package() {
  install -Dm755 "${_cli}-${pkgver}"-linux-* "${pkgdir}/usr/bin/whodb"
  install -Dm644 "whodb-${pkgver}-NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

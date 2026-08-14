# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.3
pkgrel=1
pkgdesc="Grok CLI - command line interface for xAI's Grok"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-xAI-Grok-CLI')
provides=('grok')
conflicts=('grok')
options=('!strip')
source_x86_64=("grok-$pkgver-x86_64::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok-$pkgver-aarch64::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
sha512sums_x86_64=('725d0874d51174ab5348e351748867b447b1421175101c36b637dad6a1a6fbb817b442e336c031bc370b0e2a23b03ab51e0338c186f14ea55937ebe099817cd3')
sha512sums_aarch64=('7aebe5e72f760e0cb4fe959b260d184af3004f034faf1bd3ad7a896d52a26765ef72233127ed865904c3a355c1b6ddca0510d11dc474971a5bf9c99db3611b12')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

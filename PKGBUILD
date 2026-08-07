# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.0
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
sha512sums_x86_64=('ca4cfe4ea276de75ff99383054f113b429a98d1e7d2c55428bee77fdea942ff26d4d13fdd6da90dd73d7591978b7f6f278d9d6f6d2dd428d1d25af88c1877e20')
sha512sums_aarch64=('79330b5c35e029617888d87e90a0dcc0fc27e277268982a7d2efbabd901f82027b159af9bfe2f3f1d5637665868772a0e7e4da7a4ec12f7550c0a918417dd6f6')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

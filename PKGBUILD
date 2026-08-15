# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.4
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
sha512sums_x86_64=('37f5a8a1c4caad5cbe0859bae9b3481d1b72e2dc200dbc68c200ffacc4f69a0e8b40b0eac6c04673ac3d24b6dfa8114bdcb9590bdc51aeb03d03d5555e7ba767')
sha512sums_aarch64=('74470bacdab16fe10faca024ef342c92d432bf236e6787d1deae3d4a5d6a877969eb895950f100f35f8ac5f977298de3e523419cbc701b2d66b089b5449fe5ff')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

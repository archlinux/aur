# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.30
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
sha512sums_x86_64=('752ece36a1b24639a1b5c2cd209c1fbf06c912486c54a15dcbce14c037a6b70a037540c4d15da238ed24e51fe2a1d97f2e7f0f91c5b8b729f5541291db66b00f')
sha512sums_aarch64=('26b69c3dcec5c703fce8e9a4c17b45fabb8e9c90b538ec6fdc59e89cb1c52bcba0a6c3f76413d499cd146c9441a407e73f18eb459c6d7ef148005d8920e642c8')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

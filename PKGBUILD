# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.44
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
sha512sums_x86_64=('fbb5559a1b6a4ea2e2f8310a704fe9677b7f4685b64369531bbd8f8bab432163e4f243dea1151515f61483a6d5c54a0df047afe914e4274dafcfc1a196e7c8e3')
sha512sums_aarch64=('e1e181740b878356d1fed1b1067c2a69bc9eb88bb3e2d0681e0802fecb4bd3b8371afc82a94da9b2a4d4195aa255f1f8c7def45734c9fba106f928989abab362')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

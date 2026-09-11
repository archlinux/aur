# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.25
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
sha512sums_x86_64=('2e0e0d5de0b07d1210815971bbf5098f34af0553896f924bfd81c113d7075ed35db787a2e1570074ee7aaf915661206232942d38386f3745dd0bb43d95cc7f49')
sha512sums_aarch64=('ecf7588a54d6332bea3a00a30af6d87e5596efa1e952193113da55d858a8fda71f2a05e458b95cac656b973a68b29403f9cfc8fb982a5d68a24e0a2f54aa87f9')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

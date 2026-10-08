# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.50
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
sha512sums_x86_64=('c955de8b2dc25b9b357b2882f7b2a4deb8d9f44b9ec628716c041941ed22f5633b222747c08292bd1b30493cb0ccecb2f48bce9e17f03906eb7437989ffeefc1')
sha512sums_aarch64=('8651b58a99c975b6ecd39914b5c0081e1c36941b5e3bb165e4a704ce87888317b0e50c2a98d625676e72898eaaa51fa0b07c643c2716e40220dfc5f65e2a733b')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

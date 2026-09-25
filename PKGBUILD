# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.41
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
sha512sums_x86_64=('42ceaba0b153c7e4e225413438d4dd3d237088f2bee74339441d2e7e2dd318b83e1ff5d42580a2a6e662244943771b02455ed80869b280823aab5b79a8325145')
sha512sums_aarch64=('f481c600b8b15e40a2343ea95669b5697352c3e2aa5db486b1d4865c23ee73a6bbd4b9fd1a0f819bd1e6feb68f1921e1d44c57ece709fb0d83cfce91c289bb80')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

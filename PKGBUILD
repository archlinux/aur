# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.77
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
sha512sums_x86_64=('05a5285e23d2a8276c4f89b1399c1d515527349af64fd4fc01f93e38787ff8f95726d015ef9c44709cd6cc4fc138a8a536ba2a5aa5ab0e02c981da958fde0254')
sha512sums_aarch64=('8ade765c405e9f47c481686018c5e0b35666170cc3ce54f77d43e615d5fc711ef05fd3b3eb38007eb301f0ec710d8eb27e2c80234618f8cca7c47dd7c4abb78c')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

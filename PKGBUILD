# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.70
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
sha512sums_x86_64=('059baf5fa8acd551c4438a040d22863e4d9bf10c5b1ab39033cc7c7cde52d74d592d24619151d2051ff95013875b083f2ccdb12a524a4e331f4cfdadf13c663b')
sha512sums_aarch64=('6c3935eebc77cd78f68ce365d42ebe9af32ba0d2470f759ddf20f9ed22eddd709e94357b784d41777c8592ed131c57588dcc8d2ed9dd9fe8324e9901b4909a19')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.89
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
sha512sums_x86_64=('f9ea760f36f6d69d760f3e1e770b6f671f4ae2d3be7f95b9716fff54c5f8252d52a275208ced484b9ee22482025e93babbb35746832e7a120e37836f6c5cc68a')
sha512sums_aarch64=('8b0fea4e8e8db8fcb3d48b4fc26db1b3b284b85ac6523ed6ddcdd8ccd9242fb75e1ab7f4787b8f91ca77be4daa24c5dc18cafe9b628d84c878d0d2e2480b9e84')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

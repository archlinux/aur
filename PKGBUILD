# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.13
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
sha512sums_x86_64=('5e36db59bf73b02e5eebcda717aa99401da577b14d5d2880aabf8e51297f4a98ed206d41774cdb4e845f218c9a92321b7ac202d1feac2f87e48bcf9f6a7cbe7e')
sha512sums_aarch64=('2f15d5855c76c63161daf41d8347e011264c93b74901b2aed7b3d4f733f8a7f13b6c593a2eef5d72762620f4f210c043e5f3e559d0fad9a2cac82d9a47fae437')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

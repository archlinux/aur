# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.46
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
sha512sums_x86_64=('861cd90852c15b8b0c8c36c33ce6b744c9633c1f984f1d7273f44ebfef4320603e9a354105fae25dd2d5d4894aaf79bc749fe4a222aa586818ed51be83a44dfa')
sha512sums_aarch64=('9eccfb851ccc2aa513c5474cbc3bf9ce9f2571729b4bb290ff350f90d22591ef88ebd919f2dd8dff271c7a0c18ecc1f1512b332b0f2d23cc4980d75474dd3717')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

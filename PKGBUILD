# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.5
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
sha512sums_x86_64=('4857b5b3f95d1b6ae463e54907057584afc34c1203ea565d4816487183045d4c6b2ddcca236aa1086fd79c82a3b54ece67f1a04377fb677c61af309928a8f224')
sha512sums_aarch64=('df19133ff2f4166c67abf6f62cc62a92df7d756b0019432c112cf83d9ce71e45972730799393ac3d1f51949a6eb3987167da82c52d8bd09f8299168ef60e5392')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

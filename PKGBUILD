# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.24
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
sha512sums_x86_64=('70f2a36cbb5147865653a7f0dfb62420b3e32c9338bc6f7799eb231d2b3409e733694d67b06584396272b40fbb40c8b5dbab706fc79af8948e1e8ae624bdc8d1')
sha512sums_aarch64=('938c0cbf04e960afa9b1e7edbf73c15a515bbbd79c5871af588a562ef2ce64c94a03ba83188f4de029ea3a7723dd4799e494b62768adedc73e7cfbdbfae97dc5')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}

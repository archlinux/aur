# Maintainer: LJ <aur.lj at munally.com>

pkgname=wooting-analog-sdk-bin
_pkgname=wooting-analog-sdk
pkgver=0.8.0
pkgrel=1
pkgdesc="Native support for Analog Keyboards"
#optdepends=("universal-analog-plugin-bin: Non-wooting keyboards support with udev rules")
arch=('x86_64')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL-2.0')
source=(
  "https://github.com/WootingKb/$_pkgname/releases/download/v$pkgver/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
b2sums=('b4c0a36d074b0d2f6e667365f66f123a255972764cc6501dfb31bf6cde5454451de2319c0ca92d7d251c557fc899618796d5ebfe4c08cd3d9b2105a738ac3b88')

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm644 "wrapper/sdk/libwooting_analog_sdk.so" "$pkgdir/usr/lib/libwooting_analog_sdk.so"
}

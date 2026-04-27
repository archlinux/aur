# Maintainer: LJ <aur.lj at munally.com>

pkgname=wooting-analog-sdk-bin
_pkgname=wooting-analog-sdk
pkgver=0.9.1
pkgrel=1
pkgdesc="Native support for Analog Keyboards"
optdepends=("universal-analog-plugin-bin: The analog plugins")
arch=('x86_64')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL-2.0')
source=(
  "https://github.com/WootingKb/$_pkgname/releases/download/v$pkgver/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('8df8ae7ff41c46e57aa9f8a5fa52e1ed82cf88e5dc1b90693fbc87a6213d4a11')

package() {
  cd "${srcdir}"
  bsdtar -xf "${srcdir}/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm755 "release/libwooting_analog_sdk.so" "$pkgdir/usr/lib/libwooting_analog_sdk.so"
  install -Dm755 "release/libwooting_analog_sdk.so" "$pkgdir/usr/local/share/WootingAnalogPlugins/libwooting_analog_plugin.so"
}

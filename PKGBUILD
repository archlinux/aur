# Maintainer: LJ <aur.lj at munally.com>

pkgname=wooting-analog-sdk-bin
_pkgname=wooting-analog-sdk
pkgver=0.9.1
pkgrel=3
pkgdesc="Native support for Analog Keyboards"
optdepends=("universal-analog-plugin-bin: Plugins for a wider range of keyboards")
arch=('x86_64')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL-2.0')
source=(
  "https://github.com/WootingKb/$_pkgname/releases/download/v$pkgver/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
#  "https://analogsense.org/udev-rules/70-analogsense.rules"
)
sha256sums=(
  '8df8ae7ff41c46e57aa9f8a5fa52e1ed82cf88e5dc1b90693fbc87a6213d4a11'
#  'a4cfdd8e82e13b26199c71c40494c3efd4c7d63b6f4400852bf95b00e6621a07'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${srcdir}/wooting-analog-sdk-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  install -Dm755 "release/libwooting_analog_sdk.so" "$pkgdir/usr/lib/libwooting_analog_sdk.so"
#  install -Dm644 "${srcdir}/70-analogsense.rules" "$pkgdir/etc/udev/rules.d/70-analogsense.rules"
#  echo "You can run 'sudo udevadm control --reload-rules && sudo udevadm trigger' for the udev rules to take effect immediately"
}

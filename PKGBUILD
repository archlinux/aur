# Maintainer: Rami Chowdhury <necaris@gmail.com>
# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

pkgname=popsql
pkgver=1.0.65
pkgrel=1
pkgdesc="Collaborative SQL editor to write, run, and share queries instantly"
arch=('x86_64')
url="https://popsql.io"
license=('unknown')
groups=()

depends=('gconf' 'nss' 'libxss' 'gtk2' 'gnome-keyring')
optdepends=(
  'alsa-lib: Audio notifications'
  'libnotify: Visual notifications'
  'libappindicator-gtk2: System Tray support')

options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver-$pkgrel.deb::https://get.popsql.com/download/debian")
sha512sums_x86_64=('3cf2fb5df52b975b581ad06b75053314c11c9cd2a716c92b5efb5f126cf19647ac2edc69a6b0e08c143e5a94b4d0da55adb9199fcdf2e672afceae3896e71dd0')

package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  # Create a Licenses directory, add a license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Copyright PopSQL, inc. All rights reserved" >"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

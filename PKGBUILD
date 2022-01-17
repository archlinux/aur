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
sha512sums_x86_64=('c473683bf5127b4ddd3d791d2275083ecceee7a1a92fd9a35f449327e48872989580f4cb82a5c4900c715ac3795839936d1d348655e79f5438af4af8f3d17ba3')

package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  # Create a Licenses directory, add a license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Copyright PopSQL, inc. All rights reserved" >"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

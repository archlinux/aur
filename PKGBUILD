# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

pkgname=popsql
pkgver=1.0.9
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
sha512sums_x86_64=('a3e8963d509b8f429e9441de10f9b867f29a9d1347d9015890d29bd4f46db8c35faa52695cb065561f0c1456bd35145981b0783b8f15e7f5f0aa854bc4892a34')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  # Create a Licenses directory, add a license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Copyright PopSQL, inc. All rights reserved"  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
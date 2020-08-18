# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

pkgname=popsql
pkgver=1.0.10
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
sha512sums_x86_64=('63c548bf0a54d44d69ba67a77f61b5772c6408834163b293bd00cd4b759e9afefd428c882fa7a258651645d03350ad6afd4cfa6daeb8ac0c0095a1a595a578ed')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  # Create a Licenses directory, add a license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Copyright PopSQL, inc. All rights reserved"  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
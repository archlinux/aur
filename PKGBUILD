# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

pkgname=popsql
pkgver=1.0.6
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
sha512sums_x86_64=('9db24d6e8f038b31e7e9e41afafa350fb108f222db989091473b64334cc0ad312dfd847683ac40eb37d80d3ba0da9acdef6db66b3cf4dcb6c93dc357426b7aea')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  # Create a Licenses directory, add a license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Copyright PopSQL, inc. All rights reserved"  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
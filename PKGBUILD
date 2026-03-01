# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=q5k-usb-udev
pkgver=2026.02.28
pkgrel=1
pkgdesc="Qudelix-5k USB udev rules."
arch=('any')
url="https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69"
license=('BSD')
depends=('udev')

source=("99-qudelix.rules::$url/raw/8242cefe13667ddcbe8291b5f34bb523c3142eed/99-qudelix.rules")
sha256sums=('ad149184621060ae8fe0212c34937007c1431afca1b7afb183b7ad77e03ca4d2')

package() {
  cd "$srcdir"

  local rule='99-qudelix.rules'
  install -Dm644 "$(readlink -f "$rule")" "$pkgdir/usr/lib/udev/rules.d/$rule"
}

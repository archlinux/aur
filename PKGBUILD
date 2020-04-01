# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>

_pkgname=mod-utilities
pkgname=$_pkgname-lv2-git
pkgver=r141.4a92aa8
pkgrel=1
pkgdesc="some moddevices LV2 plugins - latest git"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/moddevices/mod-utilities"
license=('GPL2')
makedepends=('lv2')
provides=('mod-utilities-lv2')
conflicts=('mod-utilities-lv2')
source=("git+https://github.com/moddevices/mod-utilities")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"

  make install INSTALL_PATH="$pkgdir/usr/lib/lv2"
}

# vim:set ts=2 sw=2 et:

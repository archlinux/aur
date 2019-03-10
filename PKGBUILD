# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.2.5+7+g82682e9
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python-dbus' 'python-gobject' 'python-setproctitle' 'rfkill')
makedepends=(git)
_commit=82682e9ff0d23cd4d3f5258b005f712cf8f5c31f  # master
source=("git+https://github.com/linuxmint/blueberry#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  cp -r etc usr "$pkgdir"
}

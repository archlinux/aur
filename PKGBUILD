# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.2.4
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python2-dbus' 'python2-gobject' 'python2-setproctitle' 'rfkill')
source=($pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz)
sha256sums=('21716752f529b5e48979b7aa4aa79113d7340239b376642ec44d82f977fb47fd')

prepare() {
  cd $pkgname-$pkgver
  # Python2 fix
  sed -i 's@^#!.*python3$@#!/usr/bin/python2@' usr/bin/blueberry{,-tray}
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}

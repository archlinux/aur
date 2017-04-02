# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.1.10
pkgrel=2
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python2-dbus' 'python2-gobject' 'python2-setproctitle' 'rfkill')
source=($pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz)
sha256sums=('2a360c2b71d06a1e3a6bde973b41bfd3d08d4b2473be45dc29a8c02335b80fe6')

prepare() {
  cd $pkgname-$pkgver
  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' usr/bin/blueberry{,-tray}
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}

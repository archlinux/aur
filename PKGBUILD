# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.1.13
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python2-dbus' 'python2-gobject' 'python2-setproctitle' 'rfkill')
source=($pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz)
sha256sums=('6a1e53d1d543417ec788e1f3dc89126a3e1a4392812977095be383f111cc915c')

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

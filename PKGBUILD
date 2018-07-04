# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.2.3
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('bluez-tools' 'gnome-bluetooth' 'python2-dbus' 'python2-gobject' 'python2-setproctitle' 'rfkill')
source=($pkgname-$pkgver.tar.gz::https://github.com/linuxmint/blueberry/archive/$pkgver.tar.gz)
sha256sums=('363a974b9b229cb0770517a55ab69e18e2937a8c59ca3aa95f6e937eec05d3fd')

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

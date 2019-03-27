# Maintainer:
# Contriburor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=18.04.3
pkgrel=1
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python2-configobj' 'python2-gobject' 'python2-pyinotify' 'python2-xdg' 'python2-xlib' 'xdg-utils' 'python2-setproctitle')
makedepends=('python2-distutils-extra' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha256sums=('8fe0ccbc667ca7f6cb1cd6a7d86961e755ce53e7360e6e59a45a4eeae13b1331')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' lib/*.py
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

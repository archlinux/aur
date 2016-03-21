# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=5.6.9
pkgrel=1
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python2-configobj' 'python2-gobject' 'python2-pyinotify' 'python2-xdg' 'python2-xlib' 'xdg-utils')
makedepends=('python2-distutils-extra' 'python2-setuptools')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/ubuntu-mate/$pkgname/get/$pkgver.tar.gz")
sha256sums=('5eb733dbd4bd12fc268e107050d703904fefb0e639defe374bd70389e951e1f2')

prepare() {
  cd ubuntu-mate-$pkgname-*
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' lib/*.py
}

package() {
  cd ubuntu-mate-$pkgname-*
  python2 setup.py install --root="$pkgdir" --optimize=1
}

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
makedepends=('git' 'python2-distutils-extra' 'python2-setuptools')
install=$pkgname.install
source=("$pkgname::git+https://bitbucket.org/ubuntu-mate/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' lib/*.py
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}

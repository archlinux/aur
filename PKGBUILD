# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=sopcast-player
pkgver=0.8.5
pkgrel=2
pkgdesc="GUI front-end for p2p TV sopcast"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sopcast-player/"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'pygtk' 'sopcast' 'vlc')
#options=('!makeflags')
install=$pkgname.install
source=(http://sopcast-player.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('731e2f2a9c9af4ec4c92321fae9a2fea')

prepare() {
  cd $srcdir/$pkgname
  # Python2 fix
  sed -i 's#PYTHON ?= /usr/bin/python#\02#' Makefile
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}
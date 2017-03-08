# Maintainer: shimi <shimi dot chen at gmail dot com>

pkgname=sopcast-player
pkgver=0.8.5
pkgrel=3
pkgdesc="GUI front-end for p2p TV sopcast"
arch=('i686' 'x86_64')
url="https://github.com/sopcast-player/sopcast-player"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'pygtk' 'sopcast' 'vlc')
#options=('!makeflags')
install=$pkgname.install
source=(https://github.com/sopcast-player/sopcast-player/files/465627/$pkgname-$pkgver.tar.gz)
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

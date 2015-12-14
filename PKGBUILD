# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=aewm++
pkgver=1.0.1
pkgrel=4
pkgdesc="A small window manager for X11 based originally off aewm"
arch=('i686' 'x86_64')
url="https://github.com/frankhale/aewmpp"
license=('GPL3')
depends=('libxext' 'gcc-libs')
makedepends=('git' 'clang')
source=("$pkgname::git://github.com/frankhale/aewmpp.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "1.0.`git show | grep ^commit | wc -l`"
}
prepare() {
  cd $pkgname
  sed "/#define VERSION/s,xxx,$pkgver," -i aewm.h
}
build() {
  cd $pkgname
  make ADDITIONAL_CFLAGS= INCLUDES= LDPATH=
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# vim: et sw=2:

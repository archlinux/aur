# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=aewm++
pkgver=1.0.1
pkgrel=1
pkgdesc="A small window manager for X11 based originally off aewm"
arch=('i686' 'x86_64')
url="https://github.com/frankhale/aewmpp"
license=('GPL3')
depends=('libxext' 'gcc-libs')
makedepends=('git')
source=("git://github.com/frankhale/aewmpp.git")
md5sums=('SKIP')
_gitname="aewmpp"

pkgver() {
  cd $_gitname
  echo "1.0.`git show | grep ^commit | wc -l`"
}
prepare() {
  cd $_gitname
  sed "/#define VERSION/s,xxx,$pkgver," -i aewm.h
}
build() {
  cd $_gitname
  make ADDITIONAL_CFLAGS= INCLUDES= LDPATH=
}
package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

# vim: et sw=2:

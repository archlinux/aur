# Maintainer: M0Rf30

pkgname=tinycamd-svn
pkgver=46
pkgrel=1
pkgdesc="A small webcam daemon for Video4Linux2 devices"
arch=('i686' 'x86_64')
url="https://tinycamd.googlecode.com"
license=('BSD')
depends=('libjpeg-turbo')
makedepends=('subversion')
source=("tinycamd::svn+http://tinycamd.googlecode.com/svn/trunk/")

pkgver() {
  cd tinycamd
  svnversion | tr -d [A-z]
}

build() {
  cd tinycamd
  make CFLAGS="-Wall -O2 -MMD $(CFLAGS) $(COPTS)"
}

package() {
  cd tinycamd
  make DESTDIR=$pkgdir install
}

md5sums=('SKIP')

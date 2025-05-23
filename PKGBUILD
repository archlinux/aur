# Maintainer: envolution
# Contributor: Brian Bidulock <bidulock@openss7.org>
# shellcheck shell=bash disable=SC2034,SC2154
# contributor: tantalum <tantalum@online.de>
pkgname=guile-cairo
pkgver=1.11.2
pkgrel=1
pkgdesc='Guile Scheme bindings for the cairo graphics library'
arch=(x86_64 i686)
license=(LGPL-3.0-only GPL-3.0-or-later)
depends=(guile cairo gc glibc)
url=http://www.non-gnu.org/guile-cairo/
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=(2E7C77C522EB8436D72320679DDCEF35D262CD87) #Daniel Llorens <daniel.llorens@bluewin.ch>
md5sums=('1e8ff3ff3d1d63eed6b964b46550640e'
         'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:set ts=2 sw=2 et:

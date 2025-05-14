# Maintainer: envolution
# Contributor: leepesjee <lpeschier at xs4all dot nl>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=cvector
pkgver=1.0.3
pkgrel=3
pkgdesc="ANSI C implementation of dynamic arrays approximating the C++ vector class"
arch=('i686' 'x86_64')
url="http://cvector.sourceforge.net/"
depends=('glibc')
license=('LGPL-2.1-only')
source=(http://downloads.sourceforge.net/project/cvector/cvector/CVector-$pkgver/CVector-$pkgver.tar.gz)
md5sums=('9de194c233e1a4a8223b5258a1d689fb')

prepare() {
  cd $srcdir/CVector-$pkgver
  sed -i "s|INSTALL_PREFIX = /usr/local|INSTALL_PREFIX = ${pkgdir}/usr|" ./Makefile
  make clean
}

build() {
  cd $srcdir/CVector-$pkgver
  make all
}

package() {
  cd $srcdir/CVector-$pkgver
  make install
}
# vim:set ts=2 sw=2 et:

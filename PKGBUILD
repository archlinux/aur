# Maintainer: envolution
# Contributor: leepesjee <lpeschier at xs4all dot nl>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=neartree
pkgver=5.1.1
pkgrel=1
pkgdesc="library for finding nearest neighbors among points in spaces of arbitrary dimensions"
arch=('i686' 'x86_64')
url="http://neartree.sourceforge.net/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'cvector')
source=(http://downloads.sf.net/neartree/NearTree-${pkgver}.tar.gz
  typo.patch)
md5sums=('4f7484496fa626da3b753025851568bf'
         'ecdedf1726457e22b2e69066daed5d40')

prepare() {
  cd $srcdir/NearTree-${pkgver}
  sed -i "s|INSTALL_PREFIX = /usr/local|INSTALL_PREFIX = ${pkgdir}/usr|" ./Makefile
  patch -Np2 -i ../typo.patch
}

build() {
  cd $srcdir/NearTree-${pkgver}
  make
}

package() {
  cd $srcdir/NearTree-${pkgver}
  make install
}
# vim:set ts=2 sw=2 et:

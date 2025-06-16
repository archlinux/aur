# Maintainer: envolution
# Contributor: leepesjee <lpeschier at xs4all dot nl>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=cvector
pkgver=1.0.4.1
pkgrel=1
pkgdesc="ANSI C implementation of dynamic arrays approximating the C++ vector class"
arch=('i686' 'x86_64')
#previous url="http://cvector.sourceforge.net/"
url="https://github.com/yayahjb/cvector/releases"
depends=('glibc')
license=('LGPL-2.1-only')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yayahjb/cvector/archive/refs/tags/CVector-${pkgver}.tar.gz")
md5sums=('4c77ff5bea6259470593cc8fa72aa912')

prepare() {
  cd $srcdir/$pkgname-CVector-$pkgver
  sed -i "s|INSTALL_PREFIX = /usr/local|INSTALL_PREFIX = ${pkgdir}/usr|" ./Makefile
  make clean
}

build() {
  cd $srcdir/$pkgname-CVector-$pkgver
  make all
}

package() {
  cd $srcdir/$pkgname-CVector-$pkgver
  make install
}
# vim:set ts=2 sw=2 et:

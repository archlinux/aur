# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=png2ico
pkgver=20021208
pkgrel=8
arch=('x86_64')
pkgdesc='Converts PNG files to Windows icon resource files'
url='http://www.winterdrache.de/freeware/png2ico/'
license=('GPL2')
depends=('libpng')
source=("http://www.winterdrache.de/freeware/png2ico/data/${pkgname}-src-2002-12-08.tar.gz")
sha256sums=('d6bc2b8f9dacfb8010e5f5654aaba56476df18d88e344ea1a32523bb5843b68e')

build() {
  cd "$srcdir"/${pkgname}
  sed -i '1,1i#include <string.h>' png2ico.cpp
  make
}

package() {
  cd "$srcdir"/${pkgname}
  install -D -m755 png2ico "$pkgdir"/usr/bin/png2ico
  install -D -m644 doc/png2ico.1 "$pkgdir"/usr/share/man/man1/png2ico.1
}

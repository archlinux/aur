# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=dynamite
pkgver=0.1.1
pkgrel=4
pkgdesc="Dynamite is a tool and library for decompressing data compressed with PKWARE Data Compression Library"
arch=('x86_64')
url="http://synce.sourceforge.net/"
license=("GPL")
source=(http://downloads.sourceforge.net/sourceforge/synce/libdynamite-$pkgver.tar.gz)
md5sums=('238bf243dba2166a2e0e141b18065235')

build() {
  cd "$srcdir"/libdynamite-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/libdynamite-$pkgver
  make DESTDIR="$pkgdir" install
}

# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: d'Ronin <daronin@2600.com>

pkgname=judy
pkgver=1.0.5
pkgrel=4
arch=('x86_64')
pkgdesc="C library creating and accessing dynamic arrays"
makedepends=(gcc)
options=(!strip)
license=('LGPL')
url="http://judy.sourceforge.net/"
source=(http://downloads.sourceforge.net/judy/Judy-$pkgver.tar.gz)
md5sums=('115a0d26302676e962ae2f70ec484a54')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

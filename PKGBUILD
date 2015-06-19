# Maintainer: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.4
pkgrel=1
pkgdesc="Open source command line SIP user agent"
arch=(i686 x86_64)
url="http://www.pjsip.org/pjsua.htm"
depends=(ffmpeg)
license=('GPL')
source=(http://www.pjsip.org/release/$pkgver/pjproject-$pkgver.tar.bz2)
 
build() {
  cd $srcdir/pjproject-$pkgver
  # make -j breaks the build
  export MAKEFLAGS=
  ./configure --prefix=/usr
  #make dep
  make
}
package() {
  cd $srcdir/pjproject-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu $pkgdir/usr/bin/pjsua
}
md5sums=('39629ca3fcedbdc7dbd8c5a707060095')

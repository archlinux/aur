# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Brian Bidlock <bidulock@openss7.org>

pkgname=libpcl
pkgver=1.12
pkgrel=3
pkgdesc='The Portable Coroutine Library (PCL) implements the low level functionality for coroutines'
license=(GPL2)
url='http://xmailserver.org/libpcl.html'
arch=(x86_64)
depends=(glibc)
source=(http://xmailserver.org/pcl-$pkgver.tar.gz)
sha1sums=('a206c8fb5a96e65005f414ac46aeccd4b3603c8d')

build() {
  cd pcl-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd pcl-$pkgver
  make DESTDIR="$pkgdir" install
}

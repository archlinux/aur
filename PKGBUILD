# $Id: PKGBUILD 112507 2014-06-02 21:55:03Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Maintainer: Mikhail Burakov <mikhail.burakov gmail com>

srcname=libmemcached
pkgname=$srcname-old
pkgver=1.0.8
pkgrel=1
pkgdesc="C and C++ client library to the memcached server, old version"
arch=('i686' 'x86_64')
url="http://libmemcached.org/"
license=('GPL')
conflicts=('libmemcached')
depends=('glibc' 'libsasl' 'libevent')
makedepends=('perl' 'memcached' 'python-sphinx')
source=(http://launchpad.net/$srcname/1.0/$pkgver/+download/$srcname-$pkgver.tar.gz)
sha256sums=('03f4eb91634f1434a93d4709eccd0c4cce3eb296b54f2b1998ca4a9ce1661ca5')

build() {
  cd "$srcdir/$srcname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$srcname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: M0Rf30

pkgname=jackcpp
pkgver=6.a0a3fa3
pkgrel=1
pkgdesc="Some c++ classes which wrap the Jack audio io api and lock-free ring buffer."
arch=(i686 x86_64)
url="http://x37v.info/jack_cpp/"
depends=('jack' 'swig' 'doxygen')
makedepends=('git')
md5sums=('e84fed611253e9d4ab42e44b76f52c1d')
license=('GPL3')
source=('jackcpp::git://github.com/x37v/jackcpp.git')

package() {
  cd jackcpp
  mkdir -p $pkgdir/usr/lib/ && mkdir -p $pkgdir/usr/include 
  make PREFIX=$pkgdir/usr DESTDIR=$pkgdir install
}

pkgver() {
  cd jackcpp
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

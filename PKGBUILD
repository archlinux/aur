# Maintainer: Brian Bidlock <bidulock@openss7.org>
pkgname=libpcl
_libname=pcl
pkgver=1.12
pkgrel=2
pkgdesc="The Portable Coroutine Library (PCL) implements the low level functionality for coroutines"
license=("GPL2")
url="http://xmailserver.org/libpcl.html"
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://xmailserver.org/$_libname-$pkgver.tar.gz")
md5sums=('816d394743d8ab1b3e20af1efebb093d')

build() {
  cd "$srcdir/$_libname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_libname-$pkgver"
  make DESTDIR="$pkgdir" install
}
        


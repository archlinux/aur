# Contributor: Maximilian Stein <theoddbird@posteo.org>

pkgname=getdata
pkgver=0.10.0
pkgrel=1
pkgdesc="reference implementation of the Dirfile Standards"
arch=('i686' 'x86_64')
url="http://getdata.sourceforge.net/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('bc7150fd2cdff314d3c0b318ffc1f572')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-matlab --with-python="/usr/bin/python2" 
  #CC="/usr/bin/gcc-5"
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install 
}

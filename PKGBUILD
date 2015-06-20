# Maintainer: DaarkWel <daarkwel at mail dot ru>
pkgname=fb2edit
pkgver=0.0.8
pkgrel=1
pkgdesc="FB2 ebooks editor"
arch=('i686' 'x86_64')
url="http://fb2edit.lintest.ru"
license=('GPL')
depends=('qtwebkit' 'libxml2')
makedepends=('cmake>=2.8.10')
source=(http://fb2edit.lintest.ru/pub/$pkgname-$pkgver.tar.bz2)
md5sums=('2c7c06f24414808d397c08fbed70b54c')
install=$pkgname.install

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
}
package() {
	cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}

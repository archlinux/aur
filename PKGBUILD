# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wsdlpull
pkgver=1.24
pkgrel=2
pkgdesc="A C++ web services client library"
arch=('i686' 'x86_64')
url="http://wsdlpull.sourceforge.net/"
license=('LGPL')
depends=(curl)
makedepends=(doxygen)
options=(!libtool)
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname%20$pkgver/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

md5sums=('c77e1637ebb113921cb4fa5408bff67b')
md256sums=('c77e1637ebb113921cb4fa5408bff67b')

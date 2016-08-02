# Maintainer: Alessandro Menti <alessandro dot menti at alessandromenti dot it>

pkgname=libdime
pkgver=r187
_commit=7cd55bc6a6d0
pkgrel=1
pkgdesc="A DXF (Data eXchange Format) file format support library"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/dime"
license=('BSD')
makedepends=('doxygen')
source=("${url}/get/${_commit}.tar.gz")
sha256sums=('23abc644771914accb47bd144ff6e533a7e6d6b6b44b588bd9ec827b236efbda')

build() {
	cd "$srcdir/Coin3D-dime-${_commit}"
	./configure --prefix=/usr --enable-html
	make
}

package() {
	cd "$srcdir/Coin3D-dime-${_commit}"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=libdbf
pkgver=0.0.2
pkgrel=2
pkgdesc="Library for accessing the content of dBASE III, IV, and 5.0 files"
url="http://dbf.berlios.de"
arch=('i686' 'x86_64')
license=('GPL')
depends=('intltool')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://github.com/quentindemetz/$pkgname/archive/$pkgver.tar.gz)
md5sums=('ebf9069074f282721947e5e3261f4bfb')

build() {
	cd $srcdir/$pkgname-$pkgver
	chmod +x autogen.sh
	#rm configure install-sh depcomp missing
	./autogen.sh && ./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=${pkgdir} install
	find ${pkgdir} -name '*.la' -exec rm {} \;
} 


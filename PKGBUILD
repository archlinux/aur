# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=divideandsucceed
pkgver=0.9.4
pkgrel=1
pkgdesc="A game in which you must divide polygons into the rigth number of equal parts."
arch=('i686' 'x86_64')
url="http://projects.haxx.es/p/divide-and-succeed/"
license=('GPL')
depends=('sdl' 'sdl_ttf')
makedepends=('make' 'cmake')
conflicts=()
source=("http://projects.haxx.es/media/upload/divide-and-succeed/files/divide-and-succeed-$pkgver.tar.gz")
md5sums=('3166dfd45e04e641e0d45f5e485616b4')

build() {
	cd $srcdir/divide-and-succeed-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $srcdir/divide-and-succeed-$pkgver
	make install DESTDIR=$pkgdir
}

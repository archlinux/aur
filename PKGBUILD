
# Maintainer: Dennis Gosnell <cdep.illabout@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=libdockapp
pkgver=0.6.4
pkgrel=1
pkgdesc="Library that provides a framework for developing dockapps."
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=libdockapp"
license=('GPL')
options=('!libtool')
depends=(libxpm)
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('6e9a5d68f329564bce9d1743dc90672e')


build() {
	cd "dockapps-d06e8c1"

	autoreconf -fvi
	./configure --prefix=/usr/ --without-examples --without-font
	make
}

package() {
	cd "dockapps-d06e8c1"

	make DESTDIR="$pkgdir/" install
}

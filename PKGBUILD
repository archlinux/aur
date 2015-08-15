# Maintainer: Stephen Martin <hwkiller at gmail.com>
pkgname=boost-nowide
_pkgname=nowide_standalone
pkgver=1.58.0
pkgrel=1
pkgdesc="Boost.Nowide is a library implemented by Artyom Beilis that make cross platform Unicode aware programming easier."
arch=('x86_64')
url="http://cppcms.com/files/nowide/html/"
license=('custom')
depends=('boost')
makedepends=('cmake' 'unzip')
options=()
source=("http://cppcms.com/files/nowide/nowide_standalone.zip")

prepare() {
	cd "$srcdir/$_pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
md5sums=('5aa92f6d8f3734bd0b511c78b8aa8835')

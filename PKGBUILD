# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
pkgname="liblogcpp"
pkgver=1.8.1
pkgrel=1
pkgdesc="A intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp.git"
license=('LGPL3')
conflicts=('liblogcpp')
provides=('liblogcpp=${pkgver}')
replaces=('liblogcpp')
depends=()
makedepends=('cmake' 'qt5-base')
source=("liblogcpp-v${pkgver}::https://github.com/nullptrT/liblogcpp/archive/1.8.1.tar.gz")
sha512=('')



prepare() {
        [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
        mkdir "$srcdir/build"
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DLOGCPP_INSTALL_LIBS=ON \
		-DLOGCPP_ENABLE_QT_SUPPORT=ON \
		"../liblogcpp"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}

md5sums=('c5ad03423f189421cc7cd031661203e5')

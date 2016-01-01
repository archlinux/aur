# Maintainer: Sebastian Lau <arch _at_ slau _dot_ info>
pkgname="liblogcpp"
pkgver=1.6.3
pkgrel=1
pkgdesc="A simple, but highly customizable and intuitive LGPL library for logging in C++."
arch=('x86_64' 'i386' 'arm6h')
url="https://github.com/gS644/liblogcpp"
license=('LGPL2.1')
depends=()
makedepends=('cmake' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/$pkgver.tar.gz")
md5sums=('703901633fc937041aa13b157860b6b5')


build() {
	cd "$srcdir"
	mkdir build
	cd build
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
		-DINSTALL_LIBS=ON \
		-DENABLE_QT_SUPPORT=ON \
		"../liblogcpp-$pkgver"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make install
}


# Maintainer: Sebastian Lau <arch _at_ slau _dot_ info>
pkgname="liblogcpp"
pkgver=1.6.2
pkgrel=1
pkgdesc="A simple, but highly customizable and intuitive LGPL library for logging in C++."
arch=('x86_64' 'i386' 'arm6h')
url="https://github.com/gS644/liblogcpp"
license=('LGPL2.1')
depends=()
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gS644/$pkgname/archive/$pkgver.tar.gz")

#git+https://github.com/gS644/liblogcpp.git")
md5sums=('68b863fb7bcb545cb99f5cd604f95f5c')


build() {
	cd "$srcdir"
	mkdir build
	cd build
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
		-DINSTALL_LIBS=ON \
		"../liblogcpp-$pkgver"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make install
}


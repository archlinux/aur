# Maintainer: Sebastian Lau <arch _at_ slau _dot_ info>
pkgname="liblogcpp"
pkgver=1.7.1
pkgrel=1
pkgdesc="A simple, but highly customizable and intuitive LGPL library for logging in C++."
arch=('x86_64' 'i386' 'arm6h')
url="https://github.com/nullptrT/liblogcpp"
license=('LGPL2.1')
depends=()
makedepends=('cmake' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/$pkgver.tar.gz")
md5sums=('fac9d7642172476a24da79f0e6f87cf9')


prepare() {
	cd "$srcdir"
	[[ -e build ]] && rm -r build
	mkdir build
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
		-DINSTALL_LIBS=ON \
		-DENABLE_QT_SUPPORT=ON \
		-DAUTOCOLOR=ON \
		"../liblogcpp-$pkgver"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make install
}


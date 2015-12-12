# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
pkgname="liblogcpp"
pkgver=1.6.2
pkgrel=2
pkgdesc="A simple, but highly customizable and intuitive LGPL library for logging in C++."
arch=('x86_64' 'i386' 'arm6h')
url="https://github.com/gS644/liblogcpp"
license=('LGPL2.1')
depends=()
makedepends=('cmake') #'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/$pkgver.tar.gz")
#source=("git+https://github.com/nullptrT/liblogcpp.git")
md5sums=('31e11e85eebf07023c86d592b0539bf5')


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


# Maintainer: Roman <savfrom4@gmail.com>
pkgname=4shot
pkgver=1.02
pkgrel=1
pkgdesc="Simple screenshot tool for X11-based systems."
arch=('i686' 'x86_64')
url="https://github.com/savfrom4/4shot"
license=('GPL3')
depends=('git' 'cmake' 'make' 'gcc')
makedepends=('libpng' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/savfrom4/4shot/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('88c7ced2b3dc0029ee33b1b4ab12154cf3c638974f8c07d55c862d14389f41b4')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
   	cmake -B build -S .
    	cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}

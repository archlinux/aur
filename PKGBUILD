# Maintainer: Peter Majchrak <petoknm@gmail.com>

pkgname=rxcpp-git
pkgver=4.1.0
pkgrel=1
pkgdesc="Reactive Extensions for C++"
arch=('x86_64')
url="https://github.com/Reactive-Extensions/RxCpp"
license=('Apache')
groups=()
depends=()
makedepends=('gcc' 'make' 'cmake' 'libcatch-cpp-headers')
source=("git+https://github.com/Reactive-Extensions/RxCpp.git#tag=4.1.0")
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "RxCpp/projects/CMake"
	cmake .
	make
}

check() {
	cd "RxCpp/projects/CMake/test"
	ctest
}

package() {
	cd "RxCpp/projects/CMake"
	make DESTDIR="$pkgdir/" install
}

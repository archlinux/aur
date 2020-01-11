pkgname=cppclibars-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A damn easy to use and customizable ascii bars in C++"
url="https://github.com/tbhaxor/cpp-clibars"
license=('GPL3')
arch=('any')
makedepends=('git')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

build() {
	cd ${pkgname}
	mkdir build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make	
}

package() {
	cd ${pkgname}/build
	make DESTDIR="${pkgdir}/" install
	install -Dm755 ../includes/clibars.hpp "${pkgdir}/usr/include/clibars.hpp"
}


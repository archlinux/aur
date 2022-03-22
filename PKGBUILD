# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname=seashell-git
pkgver=0.1
pkgrel=1
pkgdesc="A Fast and Simple UNIX shell in C"
arch=(x86_64)
url="https://github.com/mirko-r/SeaShell"
license=('MIT')
depends=('readline')
makedepends=('cmake' 'make')
source=("git+https://github.com/Mirko-r/SeaShell.git")
md5sums=("SKIP")

_name="SeaShell"

build() {
	cd "${srcdir}/$_name"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "${srcdir}/$_name/build"
	DESTDIR="$pkgdir/" make install

	# install license
	install -D -m644 "${srcdir}/$_name/LICENSE" "${pkgdir}/usr/share/licenses/${_name/-git$/}/LICENSE"
}

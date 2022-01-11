# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=rt-plugins
pkgver=0.0.6
pkgrel=2
pkgdesc="Richard Taylor's LADSPA plugins"
arch=("any")
url="https://faculty.tru.ca/rtaylor/rt-plugins/"
license=("GPL3")
makedepends=("ladspa" "cmake")
source=("https://faculty.tru.ca/rtaylor/rt-plugins/${pkgname}-${pkgver}.tar.gz")
sha1sums=("430eec188ed3bbb3dbe163f8b23a334b81d9e0aa")

build() {
	cd "${pkgname}-${pkgver}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
}

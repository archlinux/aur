# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=stl-thumb-kde
pkgver=0.4.0
pkgrel=1
license=('MIT')
pkgdesc="KDE/KIO plugin for stl-thumb, a fast lightweight thumbnail generator for STL files"
url='https://github.com/unlimitedbacon/stl-thumb-kde'
source=(git://github.com/unlimitedbacon/stl-thumb-kde.git)
depends=('stl-thumb' 'kio')
makedepends=('extra-cmake-modules')
arch=("x86_64")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 build/stlthumbnail.so          "${pkgdir}/usr/lib/qt/plugins/stlthumbnail.so"
	install -Dm644 stlthumbnail.desktop           "${pkgdir}/usr/share/kservices5/stlthumbnail.desktop"
}

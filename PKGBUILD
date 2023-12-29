pkgname=kde-fcstd-thumbnailer-git
pkgver=2.0.0
pkgrel=1
pkgdesc='FreeCAD Thumbnail Creator.'
arch=('i686' 'x86_64')
url='https://github.com/StefanHamminga/kde-fcstd-thumbnailer'
license=('GPL3')

depends=('qt5-base' 'kio5')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {	
	cd ${srcdir}/${pkgname}/
	cmake -B build -DCMAKE_PREFIX_PATH:PATH=/usr/lib/cmake/Qt5
	cmake --build build
}

package() {
	cd ${srcdir}/${pkgname}/
	install -Dm644 ./build/fcstdthumbnailer.so ${pkgdir}/usr/lib/qt/plugins/fcstdthumbnailer.so
	install -Dm644 ./src/fcstdthumbnailer.desktop ${pkgdir}/usr/share/kservices5/fcstdthumbnailer.desktop
}

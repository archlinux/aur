pkgname='geany-clang-complete-git'
pkgver=20150309
pkgrel=1
pkgdesc='a Geany plugin to provide code completion (C/C++) using clang'
arch=('x86_64' 'i686')
license=('GPL')
depends=('geany' 'clang')
source=('git://github.com/notetau/geany-clang-complete.git')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/geany-clang-complete"
	make
}

package() {
	cd "${srcdir}/geany-clang-complete"
	install -d "${pkgdir}/$(pkg-config --variable=libdir geany)/geany"
	make install PREFIX="${pkgdir}/$(pkg-config --variable=libdir geany)/geany"
}

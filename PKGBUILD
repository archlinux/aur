pkgname=hdrmerge
pkgver=5.0
pkgrel=2
pkgdesc='HDRMerge fuses two or more raw images into a single raw with an
extended dynamic range.'
arch=('i686' 'x86_64')
url='http://jcelaya.github.io/hdrmerge/'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libraw' 'exiv2' 'zlib' 'alglib' 'boost-libs')
provides=('hdrmerge')

source=("$pkgname"::"git+https://github.com/jcelaya/hdrmerge.git")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" -C ${srcdir}/${pkgname} install
}

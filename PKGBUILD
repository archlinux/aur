pkgname=hdrmerge
pkgver=0.6.0
pkgrel=2
pkgdesc='HDRMerge fuses two or more raw images into a single raw with an
extended dynamic range.'
arch=('i686' 'x86_64')
url='http://jcelaya.github.io/hdrmerge/'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libraw' 'libkexiv2' 'exiv2' 'zlib' 'alglib' 'boost-libs' 'qt5-tools')
provides=('hdrmerge')

source=("$pkgname"::"git+https://github.com/jcelaya/hdrmerge.git#commit=ca38b54f980564942a7f2b014a5f57a64c1d9019")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" -C ${srcdir}/${pkgname} install
}

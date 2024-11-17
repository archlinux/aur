# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-core
pkgver=5.0.1
pkgrel=1
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(x86_64)
url='https://github.com/cadet/CADET-Core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake git)
source=("git+https://github.com/cadet/CADET-Core#tag=v$pkgver")
sha256sums=('8d86ee2774560db6946a16b41c6fc7861e79e8e25f158fd00e8e8f44c72c36f7')

build() {
	cmake -B build \
		-S CADET-Core \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

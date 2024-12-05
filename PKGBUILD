# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-core
pkgver=5.0.2
pkgrel=1
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(x86_64)
url='https://github.com/cadet/CADET-Core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake eigen git)
source=("git+https://github.com/cadet/CADET-Core#tag=v$pkgver")
sha256sums=('15e328c47631c57a6b064f61cbd900a5687899ba110d7dbf632132eccdeb6d6f')

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

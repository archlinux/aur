# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-core
pkgver=5.0.3
pkgrel=1
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(x86_64)
url='https://github.com/cadet/CADET-Core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake eigen git)
source=("git+https://github.com/cadet/CADET-Core#tag=v$pkgver")
sha256sums=('19e8e2da426a95f12212b6e6a11e89a33cea9592d9adccccd08ec8f5e4f142a1')

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

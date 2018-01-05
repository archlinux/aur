# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=cmake-modules-libr
pkgver=1.1.411
pkgrel=1
pkgdesc="CMake module for libR"
arch=(any)
url="https://github.com/rstudio/rstudio/blob/master/cmake/modules/FindLibR.cmake"
license=('AGPL')
depends=(cmake)
source=("FindLibR-$pkgver.cmake::https://github.com/rstudio/rstudio/raw/v$pkgver/cmake/modules/FindLibR.cmake")
md5sums=('7c8b013c5bd5574c1e56a2582c1d984b')

package() {
	cmake_version="$(cmake --version | head -n1 | cut -d ' ' -f 3 | cut -d . -f 1-2)"
	install -Dm644 "$srcdir/FindLibR-$pkgver.cmake" "$pkgdir/usr/share/cmake-$cmake_version/Modules/FindLibR.cmake"
}

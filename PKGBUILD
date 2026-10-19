# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=trizbort-qt
pkgver=1.0.1
pkgrel=1
pkgdesc="C++/Qt port of Trizbort, an interactive fiction Mapper"
arch=("x86_64")
url="https://jxself.org/trizbort-qt.shtml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake')
provides=("trizbort-qt")
source=("https://jxself.org/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("65de8340920426cd8db688b245182f94908d0b21d96b5d688688f64b4f92da08")

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

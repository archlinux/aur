# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=trizbort-qt
pkgver=1.0
pkgrel=2
pkgdesc="C++/Qt port of Trizbort, an interactive fiction Mapper"
arch=("x86_64")
url="https://jxself.org/trizbort-qt.shtml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake')
provides=("trizbort-qt")
source=("https://jxself.org/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("7b66ab351ae037727df8ca133bb95613348e141eeb5645c44915d9df8e081620")

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

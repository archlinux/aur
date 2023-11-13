# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmediaplayer
pkgver=5.112.0
pkgrel=1
pkgdesc='Plugin interface for media player features'
arch=('x86_64')
url='https://invent.kde.org/frameworks/kmediaplayer'
license=('LGPL')
depends=('kparts5' 'kxmlgui5' 'qt5-base')
makedepends=('extra-cmake-modules')
groups=('kf5-aids')
source=("https://invent.kde.org/frameworks/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('b6d4b590b8509f22ef840d4811353c49ebcb11d939026254c67de30a69dbd9c3')

_srcdir="$pkgname-v$pkgver"

build() {
  cmake -B build -S "${_srcdir}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

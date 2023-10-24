# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmediaplayer
pkgver=5.111.0
pkgrel=1
pkgdesc='Plugin interface for media player features'
arch=('x86_64')
url='https://invent.kde.org/frameworks/kmediaplayer'
license=('LGPL')
depends=('kparts5' 'kxmlgui5' 'qt5-base')
makedepends=('extra-cmake-modules')
groups=('kf5-aids')
source=("https://invent.kde.org/frameworks/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('39d05d0dc886a710fa6551b96ebc3b3e9fb3a4c6fbd548df063bf178c13791a3')

_srcdir="$pkgname-v$pkgver"

build() {
  cmake -B build -S "${_srcdir}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

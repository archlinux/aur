# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-wayland-protocols-reborn
_pkgname=deepin-wayland-protocols
_pkgver=1.6.0-deepin.1.2
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc='deepin Specific Protocols for Wayland'
url="https://github.com/justforlxz/deepin-wayland-protocols"
arch=(any)
license=(LGPL)
makedepends=(qt5-base extra-cmake-modules)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justforlxz/deepin-wayland-protocols/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('5a870dedc0f67338a977c52e13b472887958d666d787ebaee261d9aff1def124')

build() {
  cmake -B build -S $_pkgname-$_pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

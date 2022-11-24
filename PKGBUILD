# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-wayland-protocols-reborn
_pkgname=deepin-wayland-protocols
_pkgver=1.6.0-deepin.1.1
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc='deepin Specific Protocols for Wayland'
url="https://github.com/justforlxz/deepin-wayland-protocols"
arch=(any)
license=(LGPL)
makedepends=(qt5-base extra-cmake-modules)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justforlxz/deepin-wayland-protocols/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('3a1efb220c1958d48caa12a4fa4873886b68faa3f12d271bbd4fa00d12854234')

build() {
  cmake -B build -S $_pkgname-$_pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-wayland-protocols-reborn
_pkgname=deepin-wayland-protocols
pkgver=1.6.0
_tag=1.6.0-deepin.1.1
pkgrel=1
pkgdesc='deepin Specific Protocols for Wayland'
arch=(any)
license=(LGPL)
depends=()
makedepends=(qt5-base extra-cmake-modules)
source=(https://github.com/justforlxz/deepin-wayland-protocols/archive/refs/tags/$_tag.tar.gz)
sha256sums=('3a1efb220c1958d48caa12a4fa4873886b68faa3f12d271bbd4fa00d12854234')
build() {
  cmake -B build -S $_pkgname-$_tag
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Martin Stolpe <martin.stolpe[at]gmail{dot}com>
# Contributor Antonio Rojas <arojas [at] archlinux.org>

_pkgname=plasma-wayland-protocols
pkgname=plasma-wayland-protocols-git
pkgver=r1019.314fb1c
pkgrel=1
pkgdesc="Plasma Specific Protocols for Wayland"
arch=(any)
url="https://kde.org/plasma-desktop"
license=(LGPL)
depends=()
makedepends=(qt5-base extra-cmake-modules git)
source=("git+https://invent.kde.org/libraries/${_pkgname}")
sha256sums=('SKIP')
provides=(plasma-wayland-protocols)
conflicts=(plasma-wayland-protocols)

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${_pkgname}
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

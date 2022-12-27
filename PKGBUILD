# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-wayland-protocols-git
pkgver=1.6.0.deepin.1.2.r0.g193899b
pkgrel=1
pkgdesc='deepin Specific Protocols for Wayland'
url="https://github.com/justforlxz/deepin-wayland-protocols"
arch=(any)
license=(LGPL)
makedepends=(qt5-base extra-cmake-modules)
provides=('deepin-wayland-protocols-reborn' 'deepin-wayland-protocols')
conflicts=('deepin-wayland-protocols-reborn' 'deepin-wayland-protocols')
source=("${pkgname}::git+https://github.com/linuxdeepin/deepin-wayland-protocols")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


pkgname=plasma6-applets-virtual-desktop-bar-wayland
pkgver=1.0.0
pkgrel=1
pkgdesc="Configurable virtual desktop bar widget for KDE Plasma 6"
arch=('x86_64')
url="https://github.com/lenonk/virtual-desktop-bar"
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S virtual-desktop-bar-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


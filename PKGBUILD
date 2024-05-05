# Maintainer:F43nd1r <support@faendir.com>

pkgname=plasma-remotecontrollers-git
pkgver=5.27.80
pkgrel=1
pkgdesc='Translate various input device events into keyboard and pointer events'
arch=(x86_64)
url='https://plasma-bigscreen.org/'
license=(GPL2)
provides=('plasma-remotecontrollers')
conflicts=('plasma-remotecontrollers')
depends=(plasma-workspace)
makedepends=(extra-cmake-modules plasma-wayland-protocols libcec)
optdepends=('libcec: TV remotes support')
source=(git+https://invent.kde.org/plasma-bigscreen/plasma-remotecontrollers.git)
sha256sums=('SKIP')

build() {
  cmake -B build -S plasma-remotecontrollers \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


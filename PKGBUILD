# Maintainer: nicman23

pkgname=breeze-lim
pkgver=5.23.2
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(ki18n)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://invent.kde.org/agrinev/breeze/-/archive/lim/breeze-lim.zip)
sha256sums=('SKIP')
provides=(breeze)
conflicts=(breeze)

build() {
  cmake -B build -S breeze-lim \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"{/usr/share/metainfo,/usr/share/plasma/look-and-feel}
}

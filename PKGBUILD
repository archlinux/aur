# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=qqc2-desktop-style-git
pkgver=6.17.0.r12.g96b4c00
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(any)
url='https://invent.kde.org/frameworks/qqc2-desktop-style'
license=(LGPL)
groups=(kf6-git)
depends=(kirigami-git kiconthemes-git)
makedepends=(extra-cmake-modules-git)
conflicts=(qqc2-desktop-style)
source=("git+https://invent.kde.org/frameworks/qqc2-desktop-style.git")
sha256sums=('SKIP')

pkgver() {
  cd "qqc2-desktop-style"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

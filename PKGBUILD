# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=qqc2-desktop-style-git
pkgver=r20.9b13b49
pkgrel=0
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme - Git Version'
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
  cd "qqc2-desktop-style-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: zan <zan@420blaze.it>

pkgname=attica-git
_name=${pkgname%-git}
pkgver=v5.72.0.r2.gef33d1e
pkgrel=1
pkgdesc='Qt5 library that implements the Open Collaboration Services API'
arch=(x86_64)
url='https://projects.kde.org/projects/frameworks/attica'
license=(LGPL)
depends=(qt5-base)
makedepends=(git extra-cmake-modules)
groups=(kf5)
conflicts=(attica)
provides=(attica)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}





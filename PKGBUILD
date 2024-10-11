# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=boxed-cpp
pkgver=1.4.3
pkgrel=1
pkgdesc="Small header-only library for easing primitive type boxing in C++"
arch=('any')
url="https://github.com/contour-terminal/boxed-cpp"
license=('Apache-2.0')
makedepends=(
  git
  cmake
)
source=("git+https://github.com/contour-terminal/boxed-cpp.git#tag=v${pkgver}")
sha256sums=('85853227b1067032f54fcfc8cff30eb49d4daa7ced7e9629910b72563c60c1e2')

build() {
  cmake -B build -S boxed-cpp \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

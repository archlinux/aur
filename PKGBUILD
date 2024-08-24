# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=boxed-cpp
pkgver=1.4.2
pkgrel=1
pkgdesc="Small header-only library for easing primitive type boxing in C++"
arch=('any')
url="https://github.com/contour-terminal/boxed-cpp"
license=('Apache-2.0')
makedepends=('git' 'cmake')
source=("git+https://github.com/contour-terminal/boxed-cpp.git#tag=v1.4.2")
sha256sums=('1f5abdfe042743fe6206d9404ac0eb34f0e82ab55c9da41d303656c30bdd18f2')

prepare() {
  cd "$pkgname"
}
build() {
  cmake -B build -S boxed-cpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: safalski
pkgname=ryuski
pkgver=0.0.3
pkgrel=1
pkgdesc="Local, trainable command assistant with a CLI and QML plugin"
arch=('x86_64')
url="https://github.com/RyuZinOh/ryuSki"
license=('BSD-2-Clause')
depends=('sqlite' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'gcc' 'qt6-base' 'qt6-tools')
optdepends=('kitty: default terminal for "go to <folder>" (override with $TERMINAL)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f76ea746785f392969257270130fe8d42cdb953c55c2cebe2d44e48f67e48f74')

build() {
  cmake -B build -S "ryuSki-$pkgver" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DRYUSKI_BUILD_QML=ON -Wno-dev && cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

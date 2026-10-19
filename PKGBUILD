# Maintainer: safalski
pkgname=ryuski
pkgver=0.0.1
pkgrel=1
pkgdesc="Local, trainable command assistant with a CLI and QML plugin"
arch=('x86_64')
url="https://github.com/RyuZinOh/ryuSki"
license=('BSD-2-Clause')
depends=('sqlite' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'gcc' 'qt6-base' 'qt6-tools')
optdepends=('kitty: default terminal for "go to <folder>" (override with $TERMINAL)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3d371e017e9e05ebbc06380adf1805bddeabd825d259429dc25f29c966811ab')

build() {
  cmake -B build -S "ryuSki-$pkgver" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DRYUSKI_BUILD_QML=ON -Wno-dev && cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: safalski <https://github.com/RyuZinOh>
pkgname=typeshi
pkgver=0.0.2
pkgrel=1
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeShi"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeShi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e815b5b26ce9e5d0821a874fbfdc5b291d2a7b893a61641d65541813971d4667')
build() {
  cmake -B build -S "typeShi-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

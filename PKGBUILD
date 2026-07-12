# Maintainer: safalski <https://github.com/RyuZinOh>
pkgname=typeshi
pkgver=0.0.3
pkgrel=1
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeShi"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeShi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50fbdcbe04c48a7e1ec577421d4cbff63ab50e552a8bf22e7d3c2679d459d267')

build() {
  cmake -B build -S "typeShi-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

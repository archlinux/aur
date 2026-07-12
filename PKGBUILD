# Maintainer: safalski <https://github.com/RyuZinOh>
pkgname=typeshi
pkgver=0.0.4
pkgrel=1
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeShi"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeShi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ab6878c2412573d7a9d427aa4203d23498bfd534fd2f290588d7d6c30fc719b')

build() {
  cmake -B build -S "typeShi-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

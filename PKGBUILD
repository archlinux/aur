# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi
pkgver=0.1.1
pkgrel=1
pkgdesc="A typing application"
arch=('x86_64')
url="https://git.safallama.com.np/safalski/typeShi"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://git.safallama.com.np/safalski/typeShi/archive/v$pkgver.tar.gz")
sha256sums=('01d1445a48c179d0d736c704ba577c133c755c438e1e7d91304ed47ee1e72550')

build() {
  cmake -B build -S "typeshi" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

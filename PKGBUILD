# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=waylib
commit=e458865
pkgver=0.0.0.r275.g${commit}
pkgrel=1
pkgdesc='A wrapper for wlroots based on Qt.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/waylib"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'qwlroots' 'ninja')
provides=('waylib')
source=("git+https://github.com/vioken/waylib")
source=("$pkgname.tar.gz::https://github.com/vioken/waylib/archive/$commit.tar.gz")
sha256sums=('552ffb101a33f7671d5caa3f2d2f45d3890f4ab2e1953fc5f03173dcb04e1b7c')

build() {
  cd $pkgname
  cmake -B . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}

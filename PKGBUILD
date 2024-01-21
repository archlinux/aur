# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=waylib
commit=e458865
pkgver=0.1.1
pkgrel=1
pkgdesc='A wrapper for wlroots based on Qt.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/waylib"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'qwlroots' 'ninja')
provides=('waylib')
source=("git+https://github.com/vioken/waylib")
source=("https://github.com/vioken/waylib/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('54c81cb2c4302ac18cbb107ad1b066793efde4846922827159cc0926d7dfb9ad')

build() {
  cd $pkgname-$pkgver
  cmake -B . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}

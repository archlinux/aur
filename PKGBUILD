# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-icons
pkgver=0.1
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=("https://github.com/cutefishos/icons/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6c67afba71ad1aa6a7ededbb266ce5496d623d98d81424304575c0d3af26881ccf249b890454fade0d07cc04c3b8c01086bf73dccf6dba4161d18c0af981d405')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}

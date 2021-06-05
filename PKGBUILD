# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-icons
pkgver=0.2
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=("https://github.com/cutefishos/icons/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('df9009d82b8156d3c63f46df68b770b7a54f179149853d55de7e6cbbd5519a9757a8a1e70a2cc5379a8e318465449045031e721a976d49b09df42e5877885321')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}

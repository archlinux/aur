# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-icons
pkgver=0.7
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=("https://github.com/cutefishos/icons/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('22259bf9f601dcfa577bdab0d12cebae48cb05dfe8ab8d67560656692cdab5afd1412c71656a64de088b0db13792d1e1f44e4eff5a713fb3274530aba0ba5c58')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-icons
pkgver=0.4
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=("https://github.com/cutefishos/icons/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('740477b4ae71e1c26b83c61108b638615fb2d36b0f3402fc5d4220c2f09772f04c90a3bcaf4463535121a4e31ca7a67a5b0980f5c64773fff4315990ffef397d')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-icons
pkgver=0.3
pkgrel=1
pkgdesc="System default icon theme of CutefishOS"
arch=('any')
url="https://github.com/cutefishos/icons"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('extra-cmake-modules' 'ninja')
source=("https://github.com/cutefishos/icons/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('460247dddf26dea382edcc83e644bf4f3eae26dd3fbdc9176607b21c70e40c52ab5174cd38faf0d2ef9afe3df5cc804779afc696be633a10b47edfd264d298ec')

build() {
  cd icons-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd icons-$pkgver
  DESTDIR="$pkgdir" ninja install
}

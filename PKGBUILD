# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.4
pkgrel=2
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio' 'solid')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('82599dd5575c05a2d9b01a46634e811a6b199e4252797829891aa89c369318b23e8250974130685ea90e424cf5a7c1be59fd784935d5742a40c5f2856ac0a8c5')

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}

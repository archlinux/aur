# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.1
pkgrel=2
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio' 'libcutefish' 'solid')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4d05997449da514b53aa4c84267cf2452a710112529273aa49db4780b1e7aff31877b9a928a70820588321d332dec74a4281aed30783e7b95cb42fd92d6e1907')

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}

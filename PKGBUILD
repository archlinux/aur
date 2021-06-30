# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.3
pkgrel=1
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio' 'libcutefish' 'solid')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6a1b15ab6b71db2acdec233f13e03be7fa0d2768495b78622e4ff357a0e54bd59582cf4821e1dc35851ff5d25d617380c3779c863271931cceda60f24b868a1b')

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}

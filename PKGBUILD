# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.5
pkgrel=1
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio' 'solid')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('29394e0b5263f56a2e4550da35e1c5d4190310f35a260e1808e0d49f3abc4eabe991b6924f4abf347b590dc9c0369e1523285a829b3b41e2c07a25b389d10819')

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}

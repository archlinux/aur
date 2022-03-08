# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.8
pkgrel=1
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio' 'solid')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('af3f1caa982c19e14357346d6227034086020977f21b4f06af500d5d92845d142ee530fb151649fd2e7dadbd1837eb13c400968a3b407412baed7044fb60101d')

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}

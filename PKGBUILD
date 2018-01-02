# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=novprog
pkgver=3.1.3
pkgrel=1
pkgdesc="A tool to graph your progress in writing a NaNoWriMo style novel"
arch=('i686' 'x86_64')
url="https://gottcode.org/novprog/"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("https://gottcode.org/novprog/novprog-${pkgver}-src.tar.bz2")
sha256sums=('694e68af9022826f3ec7db4aaa66a357dfdc4775b2d7b42f004a01e7a98374ad')
install=novprog.install

prepare() {
  cd $pkgname-$pkgver
  sed -i 1,3d novprog.pro
}

build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}

# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=novprog
pkgver=3.1.2
pkgrel=2
pkgdesc="A tool to graph your progress in writing a NaNoWriMo style novel"
arch=('i686' 'x86_64')
url="https://gottcode.org/novprog/"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("https://gottcode.org/novprog/novprog-${pkgver}-src.tar.bz2")
sha256sums=('dfeb30b040f4971178cf2780f244914a14bb64f5da4bf048c04661af951c3371')

prepare() {
  cd $pkgname-$pkgver
  sed -i 1,3d novprog.pro
}

build() {
  cd $pkgname-$pkgver
  qmake PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

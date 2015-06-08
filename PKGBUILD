# Maintainer: Antonio Rojas ( nqn1976 @ gmail.com )

pkgname=zanshin
pkgver=0.2.1
pkgrel=1
pkgdesc="To-do management application for KDE based on Akonadi"
arch=('i686' 'x86_64')
url="http://zanshin.kde.org"
license=('GPL')
install=$pkgname.install
depends=('kdepim-runtime')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://files.kde.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('e8c920f07374cb08200f990ef592938c')

build() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

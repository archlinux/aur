# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=bookmanager
pkgver=0.4
pkgrel=1
pkgdesc="A simple EBook manager app supporting basic collection management and tabbed document viewing"
arch=('i686' 'x86_64')
url="http://projects.kde.org/projects/playground/graphics/bookmanager"
license=('GPL')
depends=('kdebase-runtime' 'poppler-qt')
makedepends=('cmake' 'automoc4')
install=$pkgname.install
source=("http://kde-apps.org/CONTENT/content-files/137437-$pkgname-$pkgver.tar.gz")
md5sums=('d498b3f3e37b1105a326c40f7d9146bd')

build() {
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}

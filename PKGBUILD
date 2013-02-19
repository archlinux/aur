# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=0.3.0
pkgrel=2
pkgdesc="A string template engine based on the Django template system and written in Qt"
arch=('i686' 'x86_64')
url="http://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt4')
makedepends=('cmake' 'doxygen')
source=("http://downloads.grantlee.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('195763a3238f51f8885881fc8012cd83')

build() {
  . /etc/profile.d/qt4.sh

  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

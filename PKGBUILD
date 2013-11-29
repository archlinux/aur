# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=0.4.0
pkgrel=1
pkgdesc="A string template engine based on the Django template system and written in Qt"
arch=('i686' 'x86_64')
url="http://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt4')
makedepends=('cmake' 'doxygen')
source=("http://downloads.grantlee.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('fa8a2e9be7be7e3a89e700679e6f3014')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

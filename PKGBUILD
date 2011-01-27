# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=0.1.8
pkgrel=1
pkgdesc="A string template engine based on the Django template system and written in Qt"
arch=('i686' 'x86_64')
url="http://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt')
makedepends=('cmake')
source=("http://downloads.grantlee.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('67c24d9eb6be66997ac5d0803bde06de')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
} 

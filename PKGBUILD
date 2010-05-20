# $Id: $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=0.1.1
pkgrel=1
pkgdesc="A string template engine based on the Django template system and written in Qt"
arch=('i686' 'x86_64')
url="http://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt')
makedepends=('cmake')
source=("http://downloads.grantlee.org/${pkgname}-v${pkgver}.tar.gz")
md5sums=('961e583c5ab94e7a9a714063e047ace5')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
} 

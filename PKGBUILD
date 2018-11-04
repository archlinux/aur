# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=attica-qt4
pkgver=0.4.2
pkgrel=7
pkgdesc='A Qt4 library that implements the Open Collaboration Services API'
arch=('x86_64' 'i686')
url='https://projects.kde.org/projects/frameworks/attica'
license=('LGPL')
depends=('qt4')
makedepends=('cmake')
source=("http://download.kde.org/stable/attica/attica-${pkgver}.tar.bz2")
md5sums=('d62c5c9489a68432e8d990dde7680c24')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../attica-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT4_BUILD=1
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

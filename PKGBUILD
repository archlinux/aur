# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qimageblitz-svn
pkgver=1448888
pkgrel=1
pkgdesc="An interm image effect library (SVN version)"
arch=('i686' 'x86_64')
url='http://www.kde-org'
license=('GPL2' 'LGPL')
depends=('qt5-base')
makedepends=('cmake'
             'subversion'
             )
conflicts=('qimageblitz')
provides=('qimageblitz')
source=('svn://anonsvn.kde.org/home/kde/trunk/kdesupport/qimageblitz')
sha1sums=('SKIP')

pkgver() {
  cd qimageblitz
  echo "$(svnversion)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qimageblitz \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT4_BUILD=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

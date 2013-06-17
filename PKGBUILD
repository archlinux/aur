# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=libkscreen
pkgver=1.0
pkgrel=1
pkgdesc="KDE's screen management library"
arch=('i686' 'x86_64')
url='https://projects.kde.org/libkscreen'
license=('GPL')
depends=('kdelibs' 'qjson')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=('83dc38c6ff5d33f253f7d9a43bc986cb')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

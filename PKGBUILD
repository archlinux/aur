# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=libvlc-qt
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple library to connect Qt application with libvlc"
arch=('i686' 'x86_64')
url="https://github.com/vlc-qt/vlc-qt"
license=('GPL3')
depends=('vlc' 'qt5-declarative')
makedepends=('cmake>=2.8')
provides=('libvlc-qt')
conflicts=('libvlc-qt')
source=("https://github.com/vlc-qt/vlc-qt/archive/1.0.0.tar.gz")
md5sums=(46ae9e0c9488a178ed20a6a290bd489a)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../vlc-qt-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}

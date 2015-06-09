# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: said
# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net>

pkgname=kamoso
pkgver=2.0.2git20140902
pkgrel=1
pkgdesc="An application to take pictures and videos out of your webcam for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/kamoso"
license=('GPL')
depends=('kdebase-runtime' 'qt-gstreamer' 'libkipi')
makedepends=('cmake' 'automoc4' 'boost')
optdepends=('kipi-plugins: Facebook support')
conflicts=('kamoso-git')
source=("$pkgname-$pkgver.tar.gz"::"http://quickgit.kde.org/?p=kamoso.git&a=snapshot&h=93188573e21a4c839f346a67431155c16f01828a&fmt=tgz")
install=$pkgname.install
md5sums=('89c58bc78c2c5c77abd4fe1b52f4234c')
         
build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$pkgname \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

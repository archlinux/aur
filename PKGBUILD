pkgname=kde-cdemu-manager
pkgver=0.7.0
pkgrel=1
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/998461"
license=('GPL')
depends=('qt5-base' 'kconfigwidgets' 'kdbusaddons' 'ki18n' 'knotifications' 'kxmlgui')
depends=('cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=(https://dl.opendesktop.org/api/files/download/id/1480882170/kde_cdemu-$pkgver.tar.bz2)
md5sums=('5f5e29d98b9087e73e9b3d215c6d9327')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
        -DCMAKE_BUILD_TYPE=Release \
        ../kde_cdemu

  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}



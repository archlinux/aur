# Maintainer: sanon <sawanon at protonmail.com> 
# Contributor: Andrea Scarpino <andrea at archlinux.org>

pkgname=amor
pkgver=15.08.3
pkgrel=3
pkgdesc='On-Screen Creature'
url='https://projects.kde.org/projects/kde/kdetoys/amor'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications')
depends=('kxmlgui' 'kwindowsystem' 'kconfig' 'ki18n' 'kcoreaddons' 'kdbusaddons' 'kdoctools' 'qt5-x11extras')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=(git+https://github.com/KDE/amor.git)
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../amor \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}

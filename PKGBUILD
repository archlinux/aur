# Maintainer: Amber <amber@mail.cyborgtrees.com>
# Contributor: Andrea Scarpino <andrea at archlinux.org>

pkgname=amor
pkgver=15.08.3
pkgrel=10
pkgdesc='On-Screen Creature'
url='https://projects.kde.org/projects/kde/kdetoys/amor'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications')
depends=('kxmlgui' 'kwindowsystem' 'kconfig' 'ki18n' 'kcoreaddons' 'kdbusaddons' 'kdoctools' 'qt5-x11extras')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=(
'amor-themes-extra: 26 extra themes for KDE AMOR'
)
source=(git+https://github.com/KDE/amor.git)
sha256sums=('SKIP')

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

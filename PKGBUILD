# Maintainer: Grego Dadone <grego.dadone@gmail.com>
# Contributor: Grego Dadone <grego.dadone@gmail.com>

pkgname=amor
pkgver=15.08.3
pkgrel=11
pkgdesc='On-Screen Creature'
url='https://projects.kde.org/projects/kde/kdetoys/amor'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications')
depends=('kxmlgui5' 'kwindowsystem5' 'kconfig5' 'ki18n5' 'kcoreaddons5' 'kdbusaddons5' 'kdoctools5' 'qt5-x11extras')
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

# Maintainer: Gennadiy Chernyshyk <genaloner@gmail.com>

pkgname=plasma5-applets-pk-updates
pkgver=0.3.2
pkgrel=1
pkgdesc="Plasma applet for software updates using PackageKit"
arch=('x86_64')
url="https://github.com/KDE/plasma-pk-updates"
license=('GPL3')
depends=('packagekit' 'plasma-workspace' 'kdoctools' 'kdesignerplugin')
makedepends=('git' 'extra-cmake-modules' 'packagekit-qt5')
source=('https://github.com/KDE/plasma-pk-updates/archive/v0.3.2.tar.gz')
sha256sums=('aec868f4c1b296d079fdf13d6ebada6e3d4c3b8dcfbdb00bb66c91f606b80763')

build() {
  cd $srcdir/plasma-pk-updates-$pkgver
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd $srcdir/plasma-pk-updates-$pkgver/build
  make DESTDIR="$pkgdir/" install
}

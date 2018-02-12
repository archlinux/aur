# Contributor: ReNoM <renom@list.ru>
# Contributor: ava1ar <mail(dot)avatar(at)gmail(dot)com>
# Contributor: RealGecko <realgecko@realgecko.com>

pkgname=kde-cdemu-manager-kf5
pkgver=0.6.3
pkgrel=1
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu.KF5 version"
arch=('i686' 'x86_64')
url="https://github.com/Real-Gecko/KDE-CDEmu"
license=('GPL')
depends=('kxmlgui' 'knotifications')
depends=('cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('extra-cmake-modules' 'kdoctools' 'qt5-tools' 'python')
source=(https://github.com/Real-Gecko/KDE-CDEmu/archive/$pkgver.tar.gz)
md5sums=('36e70c79b82b27b22a9ab42a9235d030')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../KDE-CDEmu-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR=$pkgdir install
}



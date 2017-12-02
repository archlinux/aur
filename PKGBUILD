pkgname=kde-cdemu-manager
_pkgname=kde_cdemu
pkgver=0.7.3
pkgrel=2
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/998461"
license=('GPL')
depends=('qt5-base' 'kconfigwidgets' 'kdbusaddons' 'ki18n' 'knotifications' 'kxmlgui')
depends=('cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://dl.opendesktop.org/api/files/download/id/1511553040/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('f65deb825bb50a1c1bbf2a2f7a5b8ac4')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../kde_cdemu

  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}



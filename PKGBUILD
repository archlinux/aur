# Maintainer: Marcel Hasler <mahasler at gmail dot com>

pkgname=kde-cdemu-manager
_pkgname=kde_cdemu
pkgver=0.8.0
pkgrel=1
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/998461"
license=('GPL')
depends=('qt5-base' 'kconfigwidgets' 'kdbusaddons' 'ki18n' 'knotifications' 'kxmlgui' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://sourceforge.net/projects/kde-cdemu-manager/files/${_pkgname}-${pkgver}.tar.bz2/download")
md5sums=('a88bb002728db8be594b10fb403f5b08')

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



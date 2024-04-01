# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=kde-cdemu-manager
_pkgname=kde_cdemu
pkgver=0.8.2
pkgrel=1
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('x86_64')
url="https://github.com/marcelh83/kde-cdemu-manager"
license=('GPL')
depends=('gcc-libs' 'glibc' 'qt5-base' 'kconfigwidgets5' 'kcoreaddons5' 'kdbusaddons5' 'ki18n5' 'knotifications5' 'kwidgetsaddons5' 'kxmlgui5' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/marcelh83/kde-cdemu-manager/archive/refs/tags/v0.8.2.tar.gz")
sha256sums=('2a62c7e526c312b70c48aa735b68bf689ab3dd0df66dc5ce3383853c3ba54644')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}

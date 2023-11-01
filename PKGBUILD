# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=kde-cdemu-manager
_pkgname=kde_cdemu
pkgver=0.8.1
pkgrel=2
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/998461"
license=('GPL')
depends=('gcc-libs' 'glibc' 'qt5-base' 'kconfigwidgets5' 'kcoreaddons5' 'kdbusaddons5' 'ki18n5' 'knotifications5' 'kwidgetsaddons5' 'kxmlgui5' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=("${_pkgname}-${pkgver}.tar.zst::https://sourceforge.net/projects/${pkgname}/files/${_pkgname}-${pkgver}.tar.zst/download")
sha256sums=('85de3380cbf16d03726582cf7fd9f87bbe516173b4ec7096c40f1aa776ee670b')

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
  make install DESTDIR="${pkgdir}"
}

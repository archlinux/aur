# Maintainer: Matt Day <matt@msday.co.uk>
# Based on kdeplasma-applets-gmailfeed - https://aur.archlinux.org/packages/kdeplasma-applets-gmailfeed/

pkgname=kdeplasma-applets-ultimate-gmailfeed
_pkgname=plasmoid-ultimate-gmail-feed
pkgver=2.1
pkgrel=1
pkgdesc="A plasmoid for Plasma 5. It provides a list of your unread emails from your Gmail inbox. You also get notified when you receive new messages."
arch=('x86_64')
url="https://github.com/Intika-KDE-Plasmoids/plasmoid-ultimate-gmail-feed"
license=('GPL3')
depends=('plasma-framework' 'hicolor-icon-theme' 'knotifications' 'qt5-xmlpatterns')
makedepends=('extra-cmake-modules')
install=${pkgname}.install
source=('https://github.com/Intika-KDE-Plasmoids/plasmoid-ultimate-gmail-feed/archive/v2.1.tar.gz')
sha256sums=(87abf725324322a4df94f6fb6403b1f9043d8d4e667b08a9fb98aa949de6c2f4)

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_pkgname}-${pkgver}"/build

  make DESTDIR="${pkgdir}" install
}

# Maintainer: Marcello Di Guglielmo < marcellodgl(at)aruba.it >
pkgname=vncscreen
pkgver=0.3
pkgrel=3
pkgdesc="Remote desktop application for Kirigami KDE based on VNC standard"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/marcellodgl/vnc-screen"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2'
         'plasma-framework' 'libvncserver')
makedepends=('qt5-tools' 'qt5-svg' 'extra-cmake-modules')
source=("https://invent.kde.org/marcellodgl/vnc-screen/-/archive/${pkgver}.${pkgrel}/vnc-screen-${pkgver}.${pkgrel}.tar.gz")
sha256sums=('821d2bc99c82c0ec3babe326af4c802a9a0389bb7b29150b2f47de9a2fd2b99d')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S vnc-screen-${pkgver}.${pkgrel}
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}


# Maintainer: Manav Sethi <manav.sethi@outlook.in>
pkgname=kirogi-git
pkgver=7467269
pkgrel=1
epoch=
pkgdesc="A  ground control application for drones.Take to the skies, open source style"
arch=('any')
url="https://invent.kde.org/kde/kirogi"
license=('GPL' 'LGPL')
groups=()
depends=(extra-cmake-modules qt5-base qt5-gamepad qt5-location kdnssd kconfig kcoreaddons kirigami2 gettext pkgconf)
makedepends=(git make gst-plugin-qmlgl icu)
checkdepends=()
optdepends=(mavlink)
provides=(kirogi)
conflicts=()
replaces=(kirogi)
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
build () {
      cd kirogi
      mkdir build
      cd build
      cmake -DCMAKE_BUILD_TYPE=Release ..
}
package() {
          cd kirogi/build
          sudo make DESTDIR="$pkgdir/" install
}

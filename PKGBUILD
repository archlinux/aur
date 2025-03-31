# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Jiachen YANG <farseerfc@archinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archinux.org>

pkgname=snorenotify
pkgver=0.7.0
pkgrel=7
pkgdesc='Multi-platform Qt5 notification framework'
arch=('i686' 'x86_64')
url='https://github.com/KDE/snorenotify'
license=('LGPL-3.0-or-later')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'ninja' 'git')
_commit='dd32bb20abc92f193003d5536ae10736ec0eb2fc'
source=("git+${url}.git#commit=${_commit}")
sha256sums=('883c9b7fd13be7362ebb460fa567d6f9b13cec741bb1a5faeca6afcaf34b9abb')

build() {
  cmake -GNinja -S "${pkgname}" -B build -DWITH_QT4=OFF -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

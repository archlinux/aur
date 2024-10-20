# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Grimes <mgrimes at peculier dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: macxcool

pkgname=stopmotion
pkgver=0.8.7
pkgrel=1
arch=(x86_64)
pkgdesc="Stop motion animation creation program"
url="https://invent.kde.org/multimedia/stopmotion"
license=(GPL-2.0-or-later)
depends=(qt5-base qt5-multimedia libarchive libxml2 glibc gcc-libs libvorbis)
makedepends=(cmake qt5-tools)
source=("https://invent.kde.org/multimedia/stopmotion/-/archive/${pkgver}/stopmotion-${pkgver}.tar.gz")
sha256sums=('c121cbcb5a3aa76cdbbef55c3416bd442e5367fc1b36f28c4b937e0d06e91aa1')

build() {
  cmake -B build -S "stopmotion-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

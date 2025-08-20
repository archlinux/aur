# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Grimes <mgrimes at peculier dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: macxcool

pkgname=stopmotion
pkgver=0.9.0
pkgrel=1
arch=(x86_64)
pkgdesc="Stop motion animation creation program"
url="https://invent.kde.org/multimedia/stopmotion"
license=(GPL-2.0-or-later)
depends=(qt6-base qt6-multimedia libarchive libxml2 glibc gcc-libs libvorbis)
makedepends=(cmake qt6-tools vulkan-headers)
source=("https://invent.kde.org/multimedia/stopmotion/-/archive/${pkgver}/stopmotion-${pkgver}.tar.gz")
sha256sums=('81875b775a2fb40733dae018efa1b01267331cb67d2f80d2c05ddac29466b8e5')

build() {
  cmake -B build -S "stopmotion-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

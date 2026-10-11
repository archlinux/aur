# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Giovanni Cucca <giovanni.cucca@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>
# Contributor: frsfnrrg

pkgname=trackballs
pkgver=1.3.5
pkgrel=1
pkgdesc="Simple game similar to the classical game Marble Madness on the Amiga in the 80's"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url="https://trackballs.github.io/"
install=trackballs.install
makedepends=('cmake')
depends=('guile' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme' 'gettext')
replaces=(trackballs-music)
source=(https://github.com/trackballs/trackballs/archive/v${pkgver}.tar.gz)

build() {
  cd ${srcdir}/$pkgname-$pkgver
  [ ! -d build ] && mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
sha256sums=('431587933e8f01d92a976933fe415aa0b000e5e7ec053b53efac0d8004311acc')

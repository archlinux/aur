# Maintainer: Jiachen YANG <farseerfc@archinux.org>
# AUR Maintainer: Jaroslav Lichtblau <dragonlord@aur.archinux.org>

pkgname=snorenotify
pkgver=0.7.0
pkgrel=5
pkgdesc='Multi-platform Qt5 notification framework'
arch=('i686' 'x86_64')
url='https://github.com/Snorenotify/Snorenotify'
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules')
source=($pkgname-$pkgver.tar.gz::https://github.com/Snorenotify/Snorenotify/archive/v$pkgver.tar.gz)
sha256sums=('2e3f5fbb80ab993f6149136cd9a14c2de66f48cabce550dead167a9448f5bed9')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  cmake -DWITH_QT4=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}

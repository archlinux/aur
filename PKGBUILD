# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archinux.org>

pkgname=snorenotify
pkgver=0.5.2
pkgrel=1
pkgdesc='Multi-platform Qt5 notification framework'
arch=('i686' 'x86_64')
url='https://github.com/Snorenotify/Snorenotify'
license=('LGPL3')
depends=('qt5-base' 'qt5-quick1')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules')
source=($pkgname-$pkgver.tar.gz::https://github.com/Snorenotify/Snorenotify/archive/v$pkgver.tar.gz)
md5sums=('508dafd77c2cb1b57239c1dc6ad73727')

build() {
  cd "${srcdir}"/Snorenotify-$pkgver

  cmake -DWITH_QT4=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}"/Snorenotify-$pkgver

  make DESTDIR="${pkgdir}" install
}

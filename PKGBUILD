# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: sevenfourk <sevenfourk@gmail.com>

pkgname=abakus
pkgver=0.92
pkgrel=5
pkgdesc="A simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI"
arch=('i686' 'x86_64')
url="http://purinchu.net/abakus"
license=('GPL2')
depends=('kdebase-runtime' 'mpfr')
makedepends=('cmake' 'automoc4' 'flex' 'bison')
source=("https://purinchu.net/abakus/$pkgname-$pkgver.tar.bz2")
sha256sums=('9c873307bdcc8ab06a73de8bbc80fa933bf58ed64d3e1958f46635b61df39c5d')

build() {
  cd $pkgname-$pkgver

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

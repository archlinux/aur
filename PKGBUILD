# Maintainer:
# Contributor: darkapex <me@jailuthra.in>
# Contributor: sevenfourk <sevenfourk@gmail.com>

pkgname=abakus
pkgver=0.92
pkgrel=6
pkgdesc="A simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI"
arch=('i686' 'x86_64')
url="http://purinchu.net/abakus"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=("https://purinchu.net/abakus/$pkgname-$pkgver.tar.bz2")
sha256sums=('9c873307bdcc8ab06a73de8bbc80fa933bf58ed64d3e1958f46635b61df39c5d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

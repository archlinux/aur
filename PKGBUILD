# Maintainer: darkapex <me@jailuthra.in>
# Contributor: sevenfourk <sevenfourk@gmail.com>

pkgname=abakus
pkgver=0.92
pkgrel=4
pkgdesc="A simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI"
arch=('i686' 'x86_64')
url="http://purinchu.net/abakus"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'flex' 'bison')
source=("http://purinchu.net/abakus/$pkgname-$pkgver.tar.bz2")
sha1sums=('b03e5d378015345f0c49f89f3590cd36bbcc21b6')

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

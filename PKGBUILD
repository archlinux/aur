# $Id$
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=dht
pkgver=0.24
pkgrel=2
pkgdesc="BitTorrent DHT library"
arch=('i686' 'x86_64')
url="https://github.com/transmission/dht.git"
license=('MIT')
source=("git+$url#branch=post-0.24-transmission")
sha256sums=('SKIP')

build() {
  cd $srcdir/dht
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}
package() {
  cd $srcdir/dht
  make DESTDIR=$pkgdir install
  install -D dht.h "${pkgdir}"/usr/include/dht/dht.h
}

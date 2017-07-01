# Maintainer : M0Rf30

pkgname=torrential
pkgver=1.0.4
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(gtk3 libarchive libevent libunity granite openssl miniupnpc)
makedepends=(cmake vala)
source=("https://github.com/davidmhewitt/torrential/archive/$pkgver.tar.gz")

build() {
  cd $pkgname-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. 
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make DESTDIR=$pkgdir install
}

md5sums=('470a7b05cf7a09f933408fca6dbbf15e')

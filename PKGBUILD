# Maintainer: robertfoster

pkgname=torrential
pkgver=1.0.7
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(curl gtk3 libarchive libevent libunity granite openssl miniupnpc)
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

md5sums=('e00e7cf2440f96a010ecca9bec7d4712')

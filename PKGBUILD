# Maintainer : M0Rf30

pkgname=torrential
pkgver=1.0.3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(gtk3 libarchive libunity granite openssl miniupnpc)
makedepends=(cmake vala)
source=("https://github.com/davidmhewitt/torrential/archive/$pkgver.tar.gz"
	patch)

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../patch
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. 
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make DESTDIR=$pkgdir install
}

md5sums=('ae6559992ab21b402c2fb1e706cd8a9b'
         '023466acc422254b4b4463c9b6637a33')

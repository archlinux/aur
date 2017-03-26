# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-indicator
pkgver=0.3.3
pkgrel=1
pkgdesc="Provides an indicator for Haguichi"
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'haguichi')
makedepends=('cmake' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('b79ede33b255b2477316413b1d4bc5b72ad44288e92ed9934f4ab06b2c5ef8cc')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-$pkgver/build DESTDIR="$pkgdir" install
}

# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-indicator
pkgver=0.3.2
pkgrel=1
pkgdesc="Provides an indicator for Haguichi"
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'haguichi')
makedepends=('cmake' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('e5e7d740a2b3807ba96ab08e5e563b82fbda37a82f551801091d0757712cf973')

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

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.17.20231004
pkgrel=1
epoch=2
url=https://www.phidgets.com
pkgdesc="User-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('BSD')
depends=('glibc' 'libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}22/libraries/linux/${pkgname}22/${pkgname}22-$pkgver.tar.gz")
sha256sums=('37e384e86b1f8044904c1ff7d00bdb16bb2b2be87a0962848a984981f457acf8')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir" install
   install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}

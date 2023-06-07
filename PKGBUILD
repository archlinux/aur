# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.15.20230607
pkgrel=1
epoch=2
url=https://www.phidgets.com
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('LGPL3')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}22/libraries/linux/${pkgname}22/${pkgname}22-$pkgver.tar.gz")
sha256sums=('b949c91e9480db2ce9fb4d528677418b203ae5c5e44aaa368fe5956d9d4f5a43')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir/" install
}

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.4.20190731
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('84f0f8e9344afad013270f4f49a4f4d1422d601e2b37d02ed2c844b154fd232e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

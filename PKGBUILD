# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.0.0.20180704
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('87254d0f1c30f59c2dcb0e1321bb95707f948df9f5196de09500c7b98c7f8586')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

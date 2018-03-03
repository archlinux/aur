# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.0.0.20180216
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('78fbb1e2c7c3c6b78c1b66372ab0540f7f6fcbe21cbb7f9bb41ae0b2dfdbf29d')

build() {
  cd $pkgname-$pkgver
   ./configure --prefix=/usr
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

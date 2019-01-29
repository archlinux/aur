# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.0.0.20190129
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('614cc7220c2aadcb0ef55a1ae449d635b55156519722cdf01e54e8a601a7ad20')


build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

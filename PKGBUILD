# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.0.0.20180307
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4c9135e9eece38373fa144eafc4a4e161115e0713597dfba949c326a47059460')

build() {
  cd $pkgname-$pkgver
   ./configure --prefix=/usr
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

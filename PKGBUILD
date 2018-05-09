# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.0.0.20180508
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('daea6d80b41270b95c7521cd1e978ee70a0d8d5bc37fea315cebdfd4d50c71db')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

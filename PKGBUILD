# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.13.20230224
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
sha256sums=('1d0795110517eb18c806472887cafc861dd0b6a1c1045246c555bc47f6bd77e3')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir/" install
}

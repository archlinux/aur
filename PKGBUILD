# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.10.20220519
pkgrel=1
epoch=2
url=https://www.phidgets.com
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}22/libraries/linux/${pkgname}22/${pkgname}22-$pkgver.tar.gz")
sha256sums=('9ea473212c8cc09931a24b5f1564b60f71e59e22ae02b5d5204d464c030405c4')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir/" install
}


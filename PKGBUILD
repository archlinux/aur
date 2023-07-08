# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.16.20230707
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
sha256sums=('b48236d54ecf939aeacc18e575c665960dd46d247dec2997f3267700d6ec97e0')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir/" install
}

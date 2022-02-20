# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=1.10.20220211
pkgrel=1
epoch=1
url=https://www.phidgets.com
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/${pkgname}22/${pkgname}22-$pkgver.tar.gz")
sha256sums=('1c5bda131f8a438967afd3213156d153e85bc9bdfe12275b24e3cf80253aae60')

build() {
  cd ${pkgname}22-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd ${pkgname}22-$pkgver
   make DESTDIR="$pkgdir/" install
}

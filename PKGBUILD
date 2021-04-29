# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget22
pkgver=1.7.20210428
pkgrel=1
url=https://www.phidgets.com
pkgdesc="user-space access library for the Phidget devices"
conflicts=('libphidget')
provides=('libphidget')
arch=('x86_64')
license=('GPL')
depends=('libusb')
source=("https://www.phidgets.com/downloads/${pkgname#lib}/libraries/linux/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b35894fe12eaf6444b7e33a063ba698b4abe47ad8aa666b8d0c3bde931febd84')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

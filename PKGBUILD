pkgname=fxload-libusb
_spkgname=libusb
pkgver=1.0.19
pkgrel=1
pkgdesc='fxload from the libusb examples'
arch=('i686' 'x86_64')
url='http://libusb.info/'
license=('LGPL')
depends=('libusb')
source=(http://downloads.sourceforge.net/libusb/libusb-$pkgver.tar.bz2)
md5sums=('f9e2bb5879968467e5ca756cb4e1fa7e')

build() {
  cd $_spkgname-$pkgver/examples
  gcc $CFLAGS $(pkg-config --libs --cflags libusb-1.0) fxload.c ezusb.c -o fxload-libusb
}


package () {
  cd $_spkgname-$pkgver/examples
  install -m 755 -D fxload-libusb $pkgdir/usr/bin/fxload-libusb
}

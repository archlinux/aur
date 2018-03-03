# For ArchLinux by Joel Porquet

pkgname=libiio
pkgver=0.14
pkgrel=1
pkgdesc='Library for interfacing with IIO devices'
arch=(i686 x86_64)
license=(GPL2)
depends=(libxml2 avahi libserialport libaio libusb)
makedepends=(cmake python)
url='https://github.com/analogdevicesinc/libiio'
source=(libiio-$pkgver.zip::https://github.com/analogdevicesinc/libiio/archive/v$pkgver.zip)
sha1sums=('46088fd68baf34ad04b6451ebc07941185124eab')

build() {
  cd libiio-$pkgver
  cmake -DCMAKE_INSTALL_SBINDIR=bin -DCMAKE_INSTALL_LIBDIR=lib -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d .
  make
}

package() {
  cd libiio-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>
pkgname=libhid
pkgver=0.2.16
pkgrel=4
pkgdesc="A library for accessing USB HID devices"
arch=(i686 x86_64)
url="http://libhid.alioth.debian.org"
license=('GPL2')
depends=('libusb-compat')
#source=("http://alioth.debian.org/frs/download.php/file/1958/$pkgname-$pkgver.tar.gz")
#source=("ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/$pkgname-$pkgver.tar.gz")
source=("http://distcache.FreeBSD.org/ports-distfiles/$pkgname-$pkgver.tar.gz")
md5sums=('f2a427a6d6b98a5db8d17e2777173af7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-swig=no --disable-werror
  # Change enable-swig if you want python wrappers.
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=adplug
pkgver=2.2.1
pkgrel=4
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.sf.net/"
license=('LGPL')
depends=('libbinio')
source=(http://downloads.sourceforge.net/adplug/adplug-$pkgver.tar.bz2)
md5sums=('8f815fd5d254de0fe5df818df9d1d8af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=adplug
pkgver=2.3
pkgrel=1
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.sf.net/"
license=('LGPL')
depends=('libbinio')
source=(https://github.com/adplug/adplug/releases/download/adplug-$pkgver/adplug-$pkgver.tar.bz2)
md5sums=('70bd0aed926386808435da7f1b46c845')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  #rm "$pkgdir/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:

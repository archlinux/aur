# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=jpeginfo
pkgver=1.6.1
pkgrel=2
pkgdesc="Jpeg information utility"
arch=('i686' 'x86_64')
url="http://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('libjpeg')
source=(http://www.kokkonen.net/tjko/src/$pkgname-$pkgver.tar.gz)
md5sums=('344be10d6b16ec559c5d8b7e3707241f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  unset CPPFLAGS # workaround unable to find jpeglib
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/share/man/man1
  make prefix="$pkgdir/usr" install
}

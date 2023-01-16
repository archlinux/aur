# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jpeginfo
pkgver=1.7.0
pkgrel=1
pkgdesc="Jpeg information utility"
arch=('i686' 'x86_64')
url="https://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('libjpeg')
source=(https://www.kokkonen.net/tjko/src/$pkgname-$pkgver.tar.gz)
sha256sums=('dc985083448d9707d42e49bed826a247c0dbda6913c870e9a5d9bf7c74939659')

build() {
  cd $pkgname-$pkgver

  unset CPPFLAGS # workaround unable to find jpeglib
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -d $pkgdir/usr/share/man/man1
  make prefix="$pkgdir/usr" install
}

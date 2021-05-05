# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jpeginfo
pkgver=1.6.1
pkgrel=3
pkgdesc="Jpeg information utility"
arch=('i686' 'x86_64')
url="https://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('libjpeg')
source=(https://www.kokkonen.net/tjko/src/$pkgname-$pkgver.tar.gz)
sha256sums=('629e31cf1da0fa1efe4a7cc54c67123a68f5024f3d8e864a30457aeaed1d7653')

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

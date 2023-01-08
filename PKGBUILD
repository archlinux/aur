# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jpeginfo
pkgver=1.6.2
pkgrel=1
pkgdesc="Jpeg information utility"
arch=('i686' 'x86_64')
url="https://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('libjpeg')
source=(https://www.kokkonen.net/tjko/src/$pkgname-$pkgver.tar.gz)
sha256sums=('1d5fda959ebc540fa9c81376e6008756499a524a5f66f8129c87915e4ccda004')

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

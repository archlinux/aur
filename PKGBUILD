# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libbuspirate
pkgver=0.5.0
pkgrel=1
pkgdesc="A C library to talk with the bus pirate hardware"
arch=("i686" "x86_64" "armv6h") # maybe more ?
url="https://sourceforge.net/projects/libbuspirate/"
license=('GPL3')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('11d89d3ce883800770c460785f98510b7a09b4a5437d1eaec85b454400e300df')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

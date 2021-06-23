# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libbuspirate
pkgver=0.5.0
pkgrel=1
pkgdesc="A C library to talk with the bus pirate hardware"
arch=("i686" "x86_64" "armv6h") # maybe more ?
url="https://sourceforge.net/projects/libbuspirate/"
license=('GPL3')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('b3e1094296b275d6d6ab326956e6f7819cc332d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

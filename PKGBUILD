# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libbuspirate
pkgver=0.4.0
pkgrel=1
pkgdesc="The libbuspirate is a C library to talk with the bus pirate hardware"
arch=("i686" "x86_64" "armv6h") # maybe more ?
url="http://sourceforge.net/projects/libbuspirate/"
license=('GPLv3')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('fbbfdddec5ef46870463d654bb2a68f80de9c376')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

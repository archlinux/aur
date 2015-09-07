# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=uni2ascii
pkgver=4.18
pkgrel=1
pkgdesc="Provides conversion in both directions between UTF-8 and many 7-bit ASCII equivalents"
arch=('i686' 'x86_64')
url="http://billposer.org/Software/uni2ascii.html"
license=('GPL3')
source=(http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
md5sums=('a1b1df74cccd1fa997bad79c8c4ced68')

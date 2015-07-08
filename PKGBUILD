# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=scscp
pkgver=1.0.1
pkgrel=1
pkgdesc="C library for the Symbolic Computation Software Composibility Protocol"
arch=('i686' 'x86_64')
url="http://www.imcce.fr/Equipes/ASD/trip/scscp/"
license=('custom')
depends=('libxml2')
source=(http://www.imcce.fr/Equipes/ASD/trip/scscp/download/scscp-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  #make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING_CECILL_C.LIB $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('e00818acf6ebe33002c407896636cd93')

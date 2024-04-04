# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=scscp
pkgver=1.0.3
pkgrel=1
pkgdesc="C library for the Symbolic Computation Software Composibility Protocol"
arch=('i686' 'x86_64')
url="http://www.imcce.fr/Equipes/ASD/trip/scscp/"
license=('custom')
depends=('libxml2')
source=(https://sourcesup.renater.fr/frs/download.php/file/4549/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-1.0.1"
  CXXFLAGS="-std=c++11" ./configure --prefix=/usr
  make
  #make check
}

package() {
  cd "$srcdir/$pkgname-1.0.1"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING_CECILL_C.LIB $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('bd0f3a1e535d4fbb0f7a41022208be497d71f9283f354f39fa7231beb7e165f7')

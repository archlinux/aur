# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=scscp
pkgver=1.0.3
pkgrel=2
pkgdesc="C library for the Symbolic Computation Software Composibility Protocol"
arch=('i686' 'x86_64')
url="http://www.imcce.fr/Equipes/ASD/trip/scscp/"
license=('custom')
depends=('libxml2')
source=(https://www.imcce.fr/content/medias/recherche/equipes/asd/trip/$pkgname/download/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CXXFLAGS="-std=c++11" ./configure --prefix=/usr
  make
  #make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING_CECILL_C.LIB $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('a9d07b26e8f53dc723a521e991ffaa0fa62c7d37202d65919fc0ae391608ae1a')

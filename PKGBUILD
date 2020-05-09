# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=mkg3a
pkgver=0.3.1
pkgrel=2
pkgdesc="A tool to create Casio FX-CG addon (.g3a) files."
arch=('i686' 'x86_64')
url="http://www.taricorp.net/projects/mkg3a/"
license=('ZLIB')
depends=('libpng')
makedepends=('cmake')
source=(https://gitlab.com/taricorp/mkg3a/-/archive/0.3.1/mkg3a-0.3.1.tar.gz)
sha256sums=('baa5ac7250554e964f667378a38ba006094d5264b0d3c489a89b25b00a30a60d')

build() {
  cd "$srcdir/mkg3a-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/mkg3a-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

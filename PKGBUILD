# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=mkg3a
pkgver=0.4.2
pkgrel=1
pkgdesc="A tool to create Casio FX-CG addon (.g3a) files."
arch=('i686' 'x86_64')
url="https://gitlab.com/taricorp/mkg3a/"
license=('ZLIB')
depends=('libpng')
makedepends=('cmake')
source=(https://gitlab.com/taricorp/mkg3a/-/archive/${pkgver}/mkg3a-${pkgver}.tar.gz)
sha256sums=('99ab60cca6a25c3eb3aa2757684424dca4c9a62d1c66c394eed220a2ab7cbfec')

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

# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=mkg3a
pkgver=0.5.1
pkgrel=1
pkgdesc="A tool to create Casio FX-CG addon (.g3a) files."
arch=('i686' 'x86_64')
url="https://gitlab.com/taricorp/mkg3a/"
license=('ZLIB')
depends=('libpng')
makedepends=('cmake')
source=(https://gitlab.com/taricorp/mkg3a/-/archive/${pkgver}/mkg3a-${pkgver}.tar.gz)
sha256sums=('5ab6da21d62d09d7c9b13b8c27ba121244d88a7c67fc17e8a100165d30b77056')

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

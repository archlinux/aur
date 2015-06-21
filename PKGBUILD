# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Lawrence Lee <valheru at facticius dot net>
pkgname=oglft
pkgver=0.9
pkgrel=1
pkgdesc="OpenGL-FreeType Library"
arch=('i686' 'x86_64')
url="http://oglft.sourceforge.net/"
license=('LGPL')
depends=('qt3' 'libgl' 'gle-te' 'freetype2')
makedepends=('gcc' 'glut')
source=(http://downloads.sourceforge.net/oglft/oglft-$pkgver.tar.gz)
md5sums=('c3a8e0993f98edb7611c20f46631d2a6')
options=(!libtool)

build() {
  cd "$srcdir/oglft-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/oglft-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

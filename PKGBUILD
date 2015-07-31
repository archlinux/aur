# Maintainer:  apophys <admin AT kubikmilan DOT sk>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Renzo Carbonara <gnuk0001/gmail.com>

pkgname=lzip
pkgver=1.17
pkgrel=1
pkgdesc="A lossless file compressor based on the LZMA algorithm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/lzip.html"
license=('GPL3')
depends=('gcc-libs')
install=lzip.install
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('d023f1e95202e45b50656833d09eee1a8c7bd9d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr CXXFLAGS="$CXXFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install{,-man}
}

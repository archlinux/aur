# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=lzlib
pkgver=1.6
pkgrel=1
pkgdesc="A library providing in-memory LZMA compression and decompression functions"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/lzlib.html"
license=('GPL3')
depends=('gcc-libs')
options=('!emptydirs')
install=$pkgname.install
source=(http://download.savannah.gnu.org/releases/lzip/lzlib/$pkgname-$pkgver.tar.gz)
sha256sums=('c187ef5ffa9ffb01abaec667dda4d8c8b378291c68ad094c63bd75ee049e4780')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm755 minilzip "${pkgdir}"/usr/bin/minilzip
}

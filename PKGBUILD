# Maintainer:  apophys <email AT kubikmilan DOT sk>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=lziprecover
pkgver=1.21
pkgrel=1
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
url="http://www.nongnu.org/lzip/lziprecover.html"
license=('GPL')
depends=('gcc-libs')
arch=('i686' 'x86_64')
install=lziprecover.install
source=(http://download.savannah.gnu.org/releases/lzip/lziprecover/lziprecover-${pkgver}.tar.gz{,.sig})
sha256sums=('a2317bd6da78d49d8f9aadd00bd93c2dac7b280b26fbf900563e90efd0179c24'
            'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742')

build() {
  cd "${srcdir}/lziprecover-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/lziprecover-${pkgver}"

  make DESTDIR="$pkgdir" install
}

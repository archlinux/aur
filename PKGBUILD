# Maintainer:  apophys <email AT kubikmilan DOT sk>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=lziprecover
pkgver=1.20
pkgrel=1
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
url="http://www.nongnu.org/lzip/lziprecover.html"
license=('GPL')
depends=('gcc-libs')
arch=('i686' 'x86_64')
install=lziprecover.install
source=("http://download.savannah.gnu.org/releases/lzip/lziprecover/lziprecover-${pkgver}.tar.gz")
sha1sums=('b15706caf08b3a666d92f3627e07cf0134f2dbc7')

build() {
  cd "${srcdir}/lziprecover-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/lziprecover-${pkgver}"

  make DESTDIR="$pkgdir" install
}

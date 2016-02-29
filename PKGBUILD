# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=scale2x
pkgver=3.2
pkgrel=1
pkgdesc="Bitmap scaling algorithm that improves the resolution of a PNG"
arch=(i686 x86_64)
url="http://scale2x.sourceforge.net/"
license=('GPL')
depends=('libpng>=1.4')
source=(https://github.com/amadvance/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make prefix="$pkgdir"/usr install
}

md5sums=('e047693762b52b563a24d16d6a98b04b')

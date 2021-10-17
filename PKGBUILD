# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=scale2x
pkgver=4.0
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

sha256sums=('996f2673206c73fb57f0f5d0e094d3774f595f7e7e80fcca8cc045e8b4ba6d32')

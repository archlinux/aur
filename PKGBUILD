# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.0.2
pkgrel=2
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="https://www.ctan.org/pkg/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs' 'poppler')
source=(https://github.com/trueroad/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('49B8ED79B6A8C46E2F6DABB3FCD0C1621E80A02D') # Masamichi Hosoda
sha256sums=('63f3ababd5b1081ef92ff7a417597302327c1db3902cdb9827fade147558e6db'
            'SKIP')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}

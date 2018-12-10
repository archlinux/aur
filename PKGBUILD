# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.0.3
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="(https://github.com/trueroad/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('poppler')
source=(https://github.com/trueroad/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('af81f08604ea91162451d08d818f13d3f443c33832e8b9ab8ded033fde2b0298')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

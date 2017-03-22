# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.0.1
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="https://www.ctan.org/pkg/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs' 'poppler')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/support/extractpdfmark.zip")
sha256sums=('de7c7f42e926a25efbce69d401ad932227eba314c936f5352f17b1f634b69e9e')
# or any other CTAN mirror

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}

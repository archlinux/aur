# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.0.2
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="https://www.ctan.org/pkg/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs' 'poppler')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/support/extractpdfmark.zip")
sha256sums=('f0d5d18cb27b850239de81cb5ce63079eb4b1ef86bc8e81043ab42b82c66ee88')
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

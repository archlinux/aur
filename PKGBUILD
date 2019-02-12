# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.1.0
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="(https://github.com/trueroad/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('poppler')
source=("https://github.com/trueroad/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('0935045084211fcf68a9faaba2b65c037d0adfd7fa27224d2b6c7ae0fd7964cb'
            'SKIP')
validpgpkeys=('49B8ED79B6A8C46E2F6DABB3FCD0C1621E80A02D') # Masamichi Hosoda

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

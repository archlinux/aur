# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark
pkgver=1.1.1
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="https://github.com/trueroad/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('poppler')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('c62f3774c5a97df0517042dd5bbc1c3cdb65687617d1f0a3e8a6910f3191a21b'
            'SKIP')
validpgpkeys=('49B8ED79B6A8C46E2F6DABB3FCD0C1621E80A02D') # Masamichi Hosoda

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-poppler=cpp
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

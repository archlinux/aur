# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=pdfio
pkgver=1.5.0
pkgrel=1
pkgdesc="Simple C library for reading and writing PDF files"
arch=('x86_64' 'aarch64')
url="https://github.com/michaelrsweet/pdfio"
license=('Apache')
depends=('zlib')
source=("pdfio-$pkgver.tar.gz::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz")
md5sums=('4cb1b44c7a36ea0edac382bd15be1ec2')

build() {
  cd pdfio-$pkgver
  ./configure --enable-shared
  make
}

package() {
  cd pdfio-$pkgver
  make install DESTDIR="$pkgdir" prefix=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pdfio/LICENSE"
}

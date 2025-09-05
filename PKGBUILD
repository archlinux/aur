# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=pdfio
pkgver=1.5.4
pkgrel=1
pkgdesc="Simple C library for reading and writing PDF files"
arch=('x86_64' 'aarch64')
url="https://github.com/michaelrsweet/pdfio"
license=('Apache')
depends=('zlib')
source=("pdfio-$pkgver.tar.gz::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz")
md5sums=('77766a4f43be699185df162e15e4df78')

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

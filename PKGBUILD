# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=pdfio
pkgver=1.1.4
pkgrel=1
pkgdesc="Simple C library for reading and writing PDF files"
arch=('x86_64' 'aarch64')
url="https://github.com/michaelrsweet/pdfio"
license=('Apache')
makedepends=('zlib')
source=("pdfio-$pkgver.tar.gz::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz")
md5sums=('6e972b042461e342ce327d69d3cb6df9')

build() {
  cd pdfio-$pkgver
  make all-shared
}

package() {
  cd pdfio-$pkgver
  make install DESTDIR="$pkgdir" prefix=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pdfio/LICENSE"
}

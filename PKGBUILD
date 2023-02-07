# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=pdfio
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple C library for reading and writing PDF files"
arch=('x86_64' 'aarch64')
url="https://github.com/michaelrsweet/pdfio"
license=('Apache')
makedepends=('zlib')
source=("pdfio-$pkgver.tar.gz::https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz")
md5sums=("b8b520d110244fddb6769c3a1dac8272")

build() {
  cd pdfio-$pkgver
  make all-shared
}

package() {
  cd pdfio-$pkgver
  make install DESTDIR="$pkgdir" prefix=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pdfio/LICENSE"
}

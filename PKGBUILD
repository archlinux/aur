# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=gocr
pkgver=0.52
pkgrel=2
pkgdesc="OCR (Optical Character Recognition) program, which converts scanned images of text back to text files"
arch=("x86_64")
url="https://www-e.uni-magdeburg.de/jschulen/ocr/"
license=('GPL')
depends=('libjpeg-turbo' 'netpbm')
optdepends=('fig2dev: read xfig images'
            'tk: to use the tk frontend')
source=(https://www-e.uni-magdeburg.de/jschulen/ocr/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('3816B803D578F5AD12FDFE065D330C4953BDFBE3')
sha256sums=('df906463105f5f4273becc2404570f187d4ea52bd5769d33a7a8661a747b8686'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --bindir=/usr/bin --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

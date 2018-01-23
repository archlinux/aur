# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=gocr
pkgver=0.51
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
sha256sums=('6eb2ae0fa4eb07cf4163081e0194ea65f605f7db9709dd30680686804dfc2692'
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

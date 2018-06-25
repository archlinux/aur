# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Patrick Hof <patrickhof@web.de>

pkgname=pdfresurrect
pkgver=0.15
pkgrel=1
pkgdesc="PDFResurrect is a tool aimed at analyzing PDF documents"
url="http://757labs.org/wiki/Projects/pdfresurrect"
license=("GPL3")
arch=('x86_64' 'i686')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enferex/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('948cf37caa4495806e277529c04c2412')


build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}

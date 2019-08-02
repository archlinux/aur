# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Patrick Hof <patrickhof@web.de>

pkgname=pdfresurrect
pkgver=0.16
pkgrel=1
pkgdesc="PDFResurrect is a tool aimed at analyzing PDF documents"
url="http://757labs.org/wiki/Projects/pdfresurrect"
license=("GPL3")
arch=('x86_64' 'i686')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enferex/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d526e4b08399cd6fbcf129ec6cd0949b')


build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}

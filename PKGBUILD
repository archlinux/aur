# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Patrick Hof <patrickhof@web.de>

pkgname=pdfresurrect
pkgver=0.12
pkgrel=1
pkgdesc="PDFResurrect is a tool aimed at analyzing PDF documents"
url="http://757labs.org/wiki/Projects/pdfresurrect"
license=("GPL3")
arch=('x86_64' 'i686')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enferex/$pkgname/archive/v$pkgver.tar.gz"
	'01_Makefile.patch')
md5sums=('01223952c2b9b46f7a80ea1aece791c1'
         '550daedf7a2fa3a948447f881bd03e1f')


prepare() {
  patch -p0 < 01_Makefile.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}

# Contributor: Andrew Chen <andrew.chuanye.chen@gmail.com>
# Contributor: Vladimir Kutyavin <vlkut@bk.ru>

pkgname=pxlib
pkgver=0.6.6
pkgrel=1
pkgdesc="Library to read and write Paradox DB files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://pxlib.sourceforge.net/"
depends=('libgsf')
source=(http://downloads.sourceforge.net/sourceforge/pxlib/${pkgname}-${pkgver}.tar.gz)
md5sums=('a5ff1b5a0dd7ae38313e7479e651ad08')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --with-gsf \
              --disable-static

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}

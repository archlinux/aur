# Contributor: Vladimir Kutyavin <vlkut@bk.ru>
pkgname=pxview
pkgver=0.2.5
pkgrel=2
pkgdesc='Program to read Paradox database files and output them as csv, sql, sqlite or html (configured without "--with-sqlite" option)'
arch=('i686' 'x86_64')
license=('GPL')
url="http://pxlib.sourceforge.net/"
depends=('pxlib')
source=(http://downloads.sourceforge.net/sourceforge/pxlib/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('954dbb0371986d6e27802de8043c6807')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --with-gsf

  make LDFLAGS=-lgobject-2.0
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}

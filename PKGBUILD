# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Wieland Hoffmann

pkgname=dbmodel-qt4
_pkgname=dbmodel
pkgver=0.3
pkgrel=7
pkgdesc="A qt tool for drawing entity-relationship diagrams (Qt4 version)."
arch=('i686' 'x86_64')
url="http://oxygene.sk/lukas/dbmodel/"
license=('GPL')
depends=('qt4>=4.0')
conflicts=('dbmodel')
source=(http://launchpad.net/dbmodel/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz
        dbmodel-0.3-qt-4.6.patch)
md5sums=('1b8e34a92d61d3819f4d7850e2bb5311'
         'd6efa801e99d8531a08769829def0be8')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i "$srcdir/dbmodel-0.3-qt-4.6.patch"
  qmake-qt4
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m 555 \
	"$srcdir/$_pkgname-$pkgver/dbmodel" \
	"$pkgdir/usr/bin/dbmodel"
}

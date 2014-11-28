# Contributor: Michal Bozon <bozonm@vscht.cz>
pkgname=geekcode
pkgver=1.7.3
pkgrel=1
pkgdesc="Classic self-classification code generator"
arch=('i686') # at least
url="http://www.geekcode.com"
license=('GPL')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b794916a8875f71f1442f6e70432d6de')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  # Makefile install has fixed /usr/local/bin/geekcode path set
  # so install it ourselves
  install -D -m 755 geekcode $startdir/pkg/usr/bin/geekcode
}

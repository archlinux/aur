#$Id$
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Maintainer: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=3.10.1
pkgrel=4
pkgdesc="A JUnit/CppUnit/xUnit-like framework for C++."
arch=(any)
url="http://cxxtest.sourceforge.net"
license=("LGPL")
depends=('perl' 'gcc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ec7d089b6b5d67048e7db84c3231a35c')

build() {
  cd "$srcdir/$pkgname"
  install -m 755 -d "$pkgdir/usr/bin" "$pkgdir/usr/include/cxxtest" || return 1
  install -m 755 cxxtestgen.pl "$pkgdir/usr/bin/" || return 1
  install -m 644 cxxtest/* "$pkgdir/usr/include/cxxtest/" || return 1
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/{docs,sample} || return 1
  install -m644 README "$pkgdir/usr/share/doc/$pkgname" || return 1
  install -m644 docs/* "$pkgdir/usr/share/doc/$pkgname/docs" || return 1
  cp -Rf sample/* "$pkgdir/usr/share/doc/$pkgname/sample"
}

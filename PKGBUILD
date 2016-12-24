# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=4.4
pkgrel=3
pkgdesc='Unit testing framework for C++'
arch=('any')
url='http://cxxtest.com/'
license=('LGPL')
depends=('python')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8')

package() {
  cd "$pkgname-$pkgver"

  install -m 755 -d "$pkgdir/usr/"{bin,include/cxxtest}
  install -m 755 bin/cxxtestgen "$pkgdir/usr/bin/"
  install -m 644 cxxtest/* "$pkgdir/usr/include/cxxtest/"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/sample
  install -m644 README "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/guide.txt "$pkgdir/usr/share/doc/$pkgname"

  cp -Rf sample/* "$pkgdir/usr/share/doc/$pkgname/sample"

  cd python
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=4.4
pkgrel=10
pkgdesc='Unit testing framework for C++'
arch=(any)
url='https://cxxtest.com/'
license=(LGPL)
makedepends=(git)
depends=(python)
source=("git+https://github.com/CxxTest/cxxtest#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  install -m 755 -d "$pkgdir"/usr/{bin,include/cxxtest}
  install -m 755 bin/cxxtestgen "$pkgdir"/usr/bin/
  install -m 644 cxxtest/* "$pkgdir"/usr/include/cxxtest/
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/sample
  install -m644 README "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/guide.txt "$pkgdir"/usr/share/doc/$pkgname
  cp -Rf sample/* "$pkgdir/usr/share/doc/$pkgname/sample"
  cd python
  python setup.py install --root="$pkgdir" --optimize=1
}

# getver: raw.githubusercontent.com/CxxTest/cxxtest/master/doc/guide.txt
# vim: ts=2 sw=2 et:

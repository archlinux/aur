# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python2-ldap3'
pkgver=1.4.0
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python2' 'python2-pyasn1')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/76/06/cd070e0a8675529ca25172018837672d3e4ec5b2e0269383d1c793167d08/ldap3-$pkgver.tar.gz)
md5sums=('f8d350f1e64a3bfdd32f5910bd820270')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python2 setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python2 setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

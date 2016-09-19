# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python-ldap3'
pkgver=1.4.0
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python' 'python-pyasn1')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/76/06/cd070e0a8675529ca25172018837672d3e4ec5b2e0269383d1c793167d08/ldap3-$pkgver.tar.gz)
md5sums=('f8d350f1e64a3bfdd32f5910bd820270')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

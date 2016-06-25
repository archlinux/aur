# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python-ldap3'
pkgver=1.3.1
pkgrel=2
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python' 'python-pyasn1')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/e9/f7/cc13b338154bc05baaa6f0269a01c8008e57982d84d26bb18b5cc338c4eb/ldap3-$pkgver.tar.gz)
md5sums=('fef414d2153d25f888f83f5a03111b83')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Elie Bouttier <elie+aur@bouttier.eu>

pkgname='python2-ldap3'
pkgver=0.9.9.2
pkgrel=1
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client."
arch=('i686' 'x86_64')
url="https://github.com/cannatag/ldap3"
license=('LGPL')
depends=('python2' 'python2-pyasn1')
source=(http://pypi.python.org/packages/source/l/ldap3/ldap3-$pkgver.tar.gz)
md5sums=('ddd6f93740e84ddd6b70a52222a8f145')

build() {
  cd "$srcdir/ldap3-$pkgver"
  python2 setup.py build
}

package() {
  cd $srcdir/ldap3-$pkgver
  python2 setup.py install --root $pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

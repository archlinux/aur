# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_ldap_authentication
_name=trytond_ldap_authentication
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to authenticate users through LDAP"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e426e04fe1b1885a73a910256102622e57b2d4fd476d956b571d00fa59971c61')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

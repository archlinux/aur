# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

_pkg=datafreeze
pkgbase=python-${_pkg}
pkgname=(python-${_pkg} python2-${_pkg})
pkgver=0.1.0
pkgrel=1
pkgdesc="Dump (freeze) SQL query results from a database into a selection of file formats"
url="https://pypi.python.org/pypi/datafreeze"
arch=('x86_64')
license=('BSD')
makedepends=('python-pkgconfig' 'python2-pkgconfig')
#provides=(python-${_pkg} python2-${_pkg})
#conflics=${provides}

source=("https://files.pythonhosted.org/packages/source/${_pkg:0:1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
md5sums=('ccbde0ffaeffa3d9a802b7704aa38e21')

package_python2-datafreeze() {
  depends=('python2' 'python2-sqlalchemy' 'python2-alembic' 'python2-yaml' 'python2-normality' 'python2-banal')
  cd "${_pkg}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize 1
  install -D PKG-INFO "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


package_python-datafreeze() {
  depends=('python' 'python-sqlalchemy' 'python-alembic' 'python-yaml' 'python-normality' 'python-banal')
  cd "${_pkg}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize 1
  install -D PKG-INFO "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


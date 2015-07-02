# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-db-liberty"
pkgver=1.12.0
pkgrel=1
pkgdesc="Oslo Database library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.db"
license=("Apache")
provides=("python2-oslo-db")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.db/oslo.db-${pkgver}.tar.gz")
sha256sums=('11cc4b3e6d66f893dd109dcc7c5c8c5f3f15a7b1377de4ec8eca4d2e93c5007d')

build() {
  cd "${srcdir}/oslo.db-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-db-liberty() {
  depends=('python2-sqlalchemy-openstack'
           'python2-alembic>=0.7.2'
           'python2-babel>=1.3'
           'python2-oslo-utils-liberty'
           'python2-oslo-config-liberty'
           'python2-oslo-i18n-liberty'
           'python2-six>=1.9.0'
           'python2-iso8601>=0.1.9'
           'python2-stevedore-openstack'
           'python2-pbr>=0.6')
  cd "${srcdir}/oslo.db-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

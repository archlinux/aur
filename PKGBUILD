# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-db-kilo"
pkgver=1.7.1
pkgrel=1
pkgdesc="Oslo Database library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.db"
license=("Apache")
provides=("python2-oslo-db")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.db/oslo.db-${pkgver}.tar.gz")
sha256sums=('21ceab26d3fe4f69e8ec3a7444cff2f13bc8a6e298cc8ffbfbe965f782931b74')

build() {
  cd "${srcdir}/oslo.db-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-db-kilo() {
  depends=('python2-sqlalchemy-kilo' 'python2-alembic>=0.7.2' 'python2-babel>=1.3' 'python2-oslo-utils-kilo>=1.2.0' 'python2-oslo-config>=1.2.0' 'python2-oslo-i18n-kilo>=1.3.0' 'python2-six>=1.9.0' 'python2-iso8601>=0.1.9' 'python2-stevedore-kilo>=1.3.0' 'python2-pbr>=0.6')
  cd "${srcdir}/oslo.db-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

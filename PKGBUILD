# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.6
pkgrel=1
pkgdesc='A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases'
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
# https://mariadb.com/downloads/connectors/connectors-data-access/python-connector
source=("https://archive.mariadb.org/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('56207d0ca91f03c924d0617c46fb071dc923a7edb3f2e6cf8ce7d461f68a29d45ed773944aafabd4e7bd164d9ce502d84b8a2f9a2eba95c99989fc164075c7a0')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

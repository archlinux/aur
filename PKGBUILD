# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.0.10
pkgrel=1
pkgdesc='A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases'
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
# https://mariadb.com/downloads/connectors/connectors-data-access/python-connector
# https://archive.mariadb.org/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz
source=("https://dlm.mariadb.com/2220851/Connectors/python/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('cd803bc06b8c75f985c21cdfc948f6a1d20acb92c691ceed893bf89f4a12ebb0db52d99ad5164bc4468047bd6fd41b40d47dbbdad748b4ac7e71e043eb0cb877')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

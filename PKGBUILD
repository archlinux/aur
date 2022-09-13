# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.4
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
source=("https://dlm.mariadb.com/2346442/Connectors/python/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('170c10516a4cc2b9d8b7f4b510d2a6e4442bcce726947e1b84813b5a52458c4771a216ac7c512071014d84adaeb02896ad38e95be41ef45936829381fd87efaf')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

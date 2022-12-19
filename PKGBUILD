# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.1.5
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
sha512sums=('53f3a33700c4ca195495b99dc6626ddfaa8a7fea4b789747c35c6eb401227e3720048ace3fe4267624c6282f59cf79f8546db3f9bc2a53b44c7fafb9af2a1201')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

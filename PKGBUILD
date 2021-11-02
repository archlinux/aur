# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.0.8
pkgrel=1
pkgdesc='A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases'
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
source=("https://archive.mariadb.org/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('f8050630d170a7ad936507c64c5da296b2c3d26fe7d814ef3ca6e9288d67243920d82764d9d35a0e0bc628bce2dff3c757708eb6fdd91bb52a4910e36a4a6654')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

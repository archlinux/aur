# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.0.6
pkgrel=1
pkgdesc="A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases"
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
source=("https://downloads.mariadb.org/interstitial/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('6a832a29beb7d91a5b458e3870271f0027594c0e060a86055afa13e90c924f0e676cf00b2de37a778586ef241a533cbff3b594336dbc6c29bd4617d9fe60b8a0')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.0.7
pkgrel=1
pkgdesc="A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases"
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
# https://downloads.mariadb.org/connector-python
source=("https://downloads.mariadb.org/interstitial/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('d011059b9f5af7f23a4d7ec5a8713b11f18e2291c89925c95805bd043d80600a1eec272fb3e29f428d0427e5d14e05b0f31ab11a8a42d5f4f62c6c05d8b1385f')

build() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

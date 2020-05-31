# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=0.9.59
pkgrel=1
pkgdesc="A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases"
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
source=("https://downloads.mariadb.org/interstitial/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('553a42584ecaa57e2e1e7e402c22a46e3d6bb1ebf96fe9e1afd213b51fdf293f41aa2c63349e3c77d03401a2e028804de19024e25a26d1b3f4bd02c24bf68b1f')

build() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

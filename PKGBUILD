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
sha512sums=('d3812d30177f9a88f5c9e0ca12cd930b54ebc43d0d45b9f2b1f4d268be660500b722293a0fb429828498f2085c8fd3bc30db89c3c9546d08630748f03744cabb')

build() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname=python-mariadb-connector
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases"
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('python-setuptools')
source=("https://downloads.mariadb.org/interstitial/connector-python-${pkgver}/mariadb-connector-python-${pkgver}.tar.gz")
sha512sums=('60fd30231ec681b539a27a237bed90ed7ee618fe64d0fe3752c8e975dc734afef888b43b4e57f4ebcf658ce8bbb5a889cf0bcede62cdea23d2cde578ae4f557a')

build() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

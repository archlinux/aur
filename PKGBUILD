pkgname=python-mariadb-connector-git
pkgver=r525.7fe141e
pkgrel=1
pkgdesc="A Python DB API 2.0 compliant API for access to MariaDB and MySQL databases"
provides=('python-mariadb-connector')
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-python/"
license=('LGPL')
depends=('python' 'mariadb-connector-c')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/mariadb-corporation/mariadb-connector-python.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/mariadb-connector-python"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/mariadb-connector-python"
	python setup.py build
}

package() {
	cd "${srcdir}/mariadb-connector-python"
	python setup.py install --root=${pkgdir} --optimize=1
}

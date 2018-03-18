# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=python2-mysql2pgsql-git
pkgver=r86.66dc2a3
pkgrel=1
pkgdesc="Tool for migrating/converting from mysql to postgresql (master branch)"
arch=(any)
url="https://github.com/philipsoutham/py-mysql2pgsql"
license=('GPL')
depends=('python2' 'python2-psycopg2' 'python2-yaml' 'python2-termcolor' 'mysql-python' 'python2-pytz' 'python2-argparse')
makedepends=('python2-setuptools')
source=(git+https://github.com/philipsoutham/py-mysql2pgsql.git)
md5sums=('SKIP')
pkgver() {
    cd "${srcdir}/py-mysql2pgsql"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "${srcdir}/py-mysql2pgsql"
	python2 setup.py install --root="${pkgdir}"
}

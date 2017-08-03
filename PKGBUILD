# Maintainer: kaptoxic
# Contributor: carloratm <carlo.ratm@gmail.com>

pkgname=barman
_realname=barman
pkgver=2.2
pkgrel=1
pkgdesc="Backup and recovery manager for PostgreSQL"
arch=('i686' 'x86_64')
url="http://www.pgbarman.org"
license=('GPL')
depends=('rsync' 'python2' 'python2-argh' 'python2-psycopg2' 'python2-dateutil' 'python2-argcomplete')
makedepends=('python2-distribute')
provides=('barman')
options=(!emptydirs)

source=(http://sourceforge.net/projects/pgbarman/files/${pkgver}/barman-${pkgver}.tar.gz)
md5sums=('1be7b8beefa2225ae77602f0a87f6938')

package()
{
    cd "${srcdir}/barman-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

# Maintainer: carloratm <carlo.ratm@gmail.com>

pkgname=barman
_realname=barman
pkgver=1.4.0
pkgrel=7
pkgdesc="Backup and recovery manager for PostgreSQL"
arch=('i686' 'x86_64')
url="http://www.pgbarman.org"
license=('GPL')
depends=('rsync' 'python2' 'python2-argh' 'python2-psycopg2' 'python2-dateutil' 'python2-argcomplete')
makedepends=('python2-distribute')
provides=('barman')
options=(!emptydirs)

source=(http://sourceforge.net/projects/pgbarman/files/${pkgver}/barman-${pkgver}.tar.gz)
md5sums=('8f1dece6dc46c5ea469aaba8e7d0fb4b')

package()
{
    cd "${srcdir}/barman-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

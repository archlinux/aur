# $Id$
# Maintainer: Miguel Gomes <alka.setzer@gmail.com>

pkgname=pgsphere
pkgver=1.1.5
pkgrel=2
pkgdesc="Provides spherical data types, functions, and operators for PostgreSQL"
arch=('x86_64')
url="http://pgfoundry.org/projects/pgsphere/"
license=('GPL')
makedepends=('git')
depends=('postgresql')
options=('!makeflags')
source=(pgsphere::git://github.com/mdgomes/pgsphere.git)
sha256sums=('SKIP')

prepare() {
  cd pgsphere
}

build() {
  cd pgsphere
  make USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config
}

package() {
  cd pgsphere
  make DESTDIR="${pkgdir}" USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config install
}

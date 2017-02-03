# Maintainer: Svenne Krap <svenne@krap.dk>
pkgname=pglogical
pkgver=1.2.2
pkgrel=2
pkgdesc="Logical replaction for PostgreSQL"
arch=('i686' 'x86_64')
url="https://2ndquadrant.com/en/resources/pglogical/"
license=('PostgreSQL')
depends=('postgresql')
changelog=$pkgname.changelog
options=('!makeflags')
source=(https://github.com/2ndQuadrant/pglogical/archive/REL1_2_2.tar.gz)
sha256sums=('4d784e0b836a180f403260c747da7f7634104966bf4a4bb38342b87df2d14d1e')

build() {
  cd pglogical-REL1_2_2

  make  USE_PGXS=1
}

package() {
  cd pglogical-REL1_2_2

  make DESTDIR="${pkgdir}"  USE_PGXS=1 install
}

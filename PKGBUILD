pkgname=tds_fdw
pkgver=2.0.5
pkgrel=1
pkgdesc="TDS Foreign Data Wrapper for PostgreSQL"
arch=('x86_64')
url="https://github.com/tds-fdw/tds_fdw"
license=('custom')
depends=('postgresql' 'freetds')
makedepends=('clang' 'llvm')
source=("https://github.com/tds-fdw/tds_fdw/archive/v${pkgver}.tar.gz")
sha512sums=('6c11c006a2a30489724123eeccdee7bab53d970b1be44d13872ab1f5d8834684c0ed31e914cc1c996351ce0a15977b611343f1deb4acf719a04ace01267eaf40')

build() {
  cd "${srcdir}/tds_fdw-${pkgver}"
  make USE_PGXS=1
}

package() {
  cd "${srcdir}/tds_fdw-${pkgver}"
  make USE_PGXS=1 DESTDIR="${pkgdir}" install
}

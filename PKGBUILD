pkgname=tds_fdw
pkgver=2.0.3
pkgrel=1
pkgdesc="TDS Foreign Data Wrapper for PostgreSQL"
arch=('x86_64')
url="https://github.com/tds-fdw/tds_fdw"
license=('custom')
depends=('postgresql' 'freetds')
makedepends=('clang15' 'llvm15')
source=("https://github.com/tds-fdw/tds_fdw/archive/v${pkgver}.tar.gz")
sha512sums=(
  'df8434cd51cd9e9f697bd7d7388eeb2fe45de8a9208bea1530b601cc04de5ec080977bfecc1c8c7d68589655917599404ec6b59aeb79567a3dce28889f5151e2'
)

build() {
  cd "${srcdir}/tds_fdw-${pkgver}"
  make USE_PGXS=1
}

package() {
  cd "${srcdir}/tds_fdw-${pkgver}"
  make USE_PGXS=1 DESTDIR="${pkgdir}" install
}

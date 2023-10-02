pkgname=arrow-flight-sql-postgresql
_pkgname=apache-arrow-flight-sql-postgresql
pkgver=0.1.0
pkgrel=1
pkgdesc="Arrow Flight SQL endpoint for PostgreSQL"
arch=(x86_64)
url="https://arrow.apache.org"
license=(Apache)
depends=(arrow postgresql-libs)
makedepends=(meson)
source=(https://github.com/apache/arrow-flight-sql-postgresql/releases/download/$pkgver/apache-arrow-flight-sql-postgresql-$pkgver.tar.gz)
sha256sums=('d629ec1ebe3761d872ecceee72e39498bdc590fa56f6cb61e8e16b086d83fda4')

build(){
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

package(){
  meson install -C build --destdir "$pkgdir"
}

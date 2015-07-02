# Maintainer: SaultDon <sault.don gmail>
pkgname=virtualpg
pkgver=1.0.1
pkgrel=1
pkgdesc="A loadable dynamic extension module to both SQLite and SpatiaLite implementing VirtualPostgres (direct SQL cross access to PostgreSQL/PostGIS tables)"
arch=(any)
url="https://www.gaia-gis.it/fossil/virtualpg/index"
license=('GPLv2')
depends=('libspatialite' 'sqlite' 'postgresql-libs' 'postgis')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
changelog="$pkgname.changelog"
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-$pkgver.tar.gz")
sha1sums=('20849c368a2bef3e8532765589d0b6b445d56908')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install-strip
}

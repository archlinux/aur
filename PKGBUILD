# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=pgsql-http
pkgver=1.7.0
pkgrel=1
pkgdesc="HTTP client for PostgreSQL, retrieve a web page from inside the database."
arch=('any')
url="https://github.com/pramsey/pgsql-http"
license=('MIT')
depends=('postgresql-libs' 'curl')
source=(https://github.com/pramsey/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha1sums=('fab2bc428005db91b99fa6819dadf515c8e9cd6f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


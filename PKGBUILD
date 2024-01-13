# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=pgcopydb
pkgver=0.15
pkgrel=1
pkgdesc="pgcopydb is a tool that automates running pg_dump | pg_restore between two running Postgres servers"
arch=('any')
url="https://github.com/dimitri/pgcopydb"
license=('PostgreSQL License')
depends=('postgresql-libs')
makedepends=('icu' 'krb5' 'openssl>=1.0.0' 'readline>=6.0' 'pam' 'zlib' 'libxml2' 'libxslt' )

source=(https://github.com/dimitri/pgcopydb/archive/refs/tags/v$pkgver.zip)
sha1sums=('e6419e430b7ef9103736e618fdaa2a07c3b1c09e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


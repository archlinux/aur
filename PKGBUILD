# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=pgcopydb
pkgver=0.16
pkgrel=1
pkgdesc="pgcopydb is a tool that automates running pg_dump | pg_restore between two running Postgres servers"
arch=('any')
url="https://github.com/dimitri/pgcopydb"
license=('PostgreSQL License')
depends=('postgresql-libs')
makedepends=('icu' 'krb5' 'openssl>=1.0.0' 'readline>=6.0' 'pam' 'zlib' 'libxml2' 'libxslt' )

source=(https://github.com/dimitri/pgcopydb/archive/refs/tags/v$pkgver.zip)
sha1sums=('fab92e7b4ddcf2b328c1ea637350171193a4f9e9')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


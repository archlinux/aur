# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=pgcopydb
pkgver=0.14
pkgrel=1
pkgdesc="pgcopydb is a tool that automates running pg_dump | pg_restore between two running Postgres servers"
arch=('any')
url="https://github.com/dimitri/pgcopydb"
license=('PostgreSQL License')
depends=('postgresql-libs')
makedepends=('icu' 'krb5' 'openssl>=1.0.0' 'readline>=6.0' 'pam' 'zlib' 'libxml2' 'libxslt' )

source=(https://github.com/dimitri/pgcopydb/archive/refs/tags/v$pkgver.zip)
sha1sums=('6557e118a80bb01bdaf9e0c9cb100f88692b8b48')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


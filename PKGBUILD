# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=pgcopydb
pkgver=0.17
pkgrel=1
pkgdesc="pgcopydb is a tool that automates running pg_dump | pg_restore between two running Postgres servers"
arch=('any')
url="https://github.com/dimitri/pgcopydb"
license=('PostgreSQL License')
depends=('postgresql-libs')
makedepends=('icu' 'krb5' 'openssl>=1.0.0' 'readline>=6.0' 'pam' 'zlib' 'libxml2' 'libxslt' )

source=(https://github.com/dimitri/pgcopydb/archive/refs/tags/v$pkgver.zip)
sha1sums=('ddb195efe3a2fc6b471fa96e0bcb9a6403b251df')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


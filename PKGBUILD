# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=postgresql_anonymizer
pkgver=1.3.2
pkgrel=1
pkgdesc="Anonymization & Data Masking for PostgreSQL"
arch=('any')
url="https://labs.dalibo.com/postgresql_anonymizer"
license=('custom:PostgreSQL')
depends=('postgresql-libs' 'python')
makedepends=('llvm' 'clang')
source=(https://gitlab.com/dalibo/postgresql_anonymizer/-/archive/$pkgver/postgresql_anonymizer-$pkgver.tar.gz)
sha1sums=('63707f5389d879909e49a2dd78d22ee28afcc7f6')

build() {
	cd "$pkgname-$pkgver"
	make extension
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


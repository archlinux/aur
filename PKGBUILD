# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>

pkgname=postgresql_anonymizer
pkgver=1.1.0
pkgrel=2
pkgdesc="Anonymization & Data Masking for PostgreSQL"
arch=('any')
url="https://labs.dalibo.com/postgresql_anonymizer"
license=('custom:PostgreSQL')
depends=('postgresql-libs' 'python')
makedepends=('llvm15' 'clang15')
source=(https://gitlab.com/dalibo/postgresql_anonymizer/-/archive/$pkgver/postgresql_anonymizer-$pkgver.tar.gz)
sha1sums=('1067f7a1a590c781e8601567105873565c579a96')

build() {
	cd "$pkgname-$pkgver"
	make extension
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


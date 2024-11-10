# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=pg_show_plans
pkgver=2.1.2

pkgrel=1
pkgdesc="Shows the query plans of all currently running SQL statements"
arch=('x86_64')
url="https://www.cybertec-postgresql.com/en/products/pg-show-plans/"
license=('The PostgreSQL Licence')
depends=('postgresql')
makedepends=('clang')
source=("https://github.com/cybertec-postgresql/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb8a23163e7f95adda919c45cb86537ea47a3489244b7c44980164b790ec625d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export USE_PGXS=1
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export USE_PGXS=1
	export DESTDIR="${pkgdir}"
	make install
}

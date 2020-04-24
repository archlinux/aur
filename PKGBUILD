# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=pg_show_plans
pkgver=1.0.0
_pkgver=REL_EE_${pkgver//./_}

pkgrel=1
pkgdesc="Shows the query plans of all currently running SQL statements"
arch=('x86_64')
url="https://www.cybertec-postgresql.com/en/products/pg-show-plans/"
license=('The PostgreSQL Licence')
depends=('postgresql')
backup=('')
source=("https://github.com/cybertec-postgresql/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('775a0329d92d7a467eba324d89c5629a3dafe887dd4ce1b9fc35b0d2ec396c73')

build() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	export USE_PGXS=1
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	export USE_PGXS=1
	export DESTDIR="${pkgdir}"
	make install
}

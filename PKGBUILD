# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.4.1
pkgrel=0
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=(any)
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs' 'llvm15' 'clang15')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("8891e4784878d0289593ea0fbe468e22a6dc1ee93b60e74fe04c71fd6d2600bc")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}

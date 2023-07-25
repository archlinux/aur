# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.1.1
pkgrel=1
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=(any)
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs' 'llvm')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("94b0687f77c7b7f2604eb4496caf17ef34fe2492b95f765e61b5ff20a5367cae")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}

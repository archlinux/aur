# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.6.0
pkgrel=4
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=("x86_64" "aarch64")
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs' 'llvm' 'clang')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0fa6c710929d003f6ce276a7de7a864e9d1667b2d78be3dc2c07f2409eb55867")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}
